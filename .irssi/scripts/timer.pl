# 
# TDO:
# 	* time formatting/translation
# 	* /timer now - launch a timer job, instead of waiting
# 	* dump/load table to/from file
#	* formatting
#	* help doc

use strict;
use warnings;

use Data::Dumper;

use Text::ParseWords;

use Irssi qw(
	command_bind command_runsub
	signal_add_first
	timeout_add timeout_add_once
	timeout_remove
);


### Vars

our $VERSION = '0.00';

our %IRSSI = (
	authors     => 'jgr',
	contact     => 'jgr006@gmail.com',
	name        => 'timers',
	description => 'Bad timers.',
	license     => 'Public Domain'
);

my @jobs;

### Halpers

sub crap {
	Irssi::print $IRSSI{name} . ": " . sprintf(shift, @_), MSGLEVEL_CLIENTCRAP;
}

sub execute_job {
	my $id = shift;

	my %job = %{$jobs[$id]};

	for (@{$job{servers}}) {
		my $server = Irssi::server_find_tag($_);
		$server->command($job{command});
	}

	if (!$job{recurring}) {
		splice @jobs, $id, 1;
	}
}

sub parse_add_args {

	my $line = shift;
	my %job;
	
# server1,server2 time [recurring] "command to execute"
	my @args = shellwords($line);
	
	if (!@args) {
		return undef;
	}

	$job{servers} = [split(',', shift @args)];
	
	$job{time} = shift @args;

	if (@args > 1) {
		shift @args;
		$job{recurring} = 1;
	}

	$job{command} = shift @args;

	return {%job};
}

### Binds

command_bind $IRSSI{name} => sub {
	my ($data, $server, $witem) = @_;

	$data =~ s/\s+$//g;

	if ($data eq '') {
		$data = "list";
	}

	command_runsub($IRSSI{name}, $data, $server, $witem);
};

command_bind "$IRSSI{name} add" => sub {
	my ($data, $server, $witem) = @_;

	my $job = parse_add_args($data);

	if (!defined $job) {
		crap "No arguments given";
		return;
	}

	# condense these checks:
	my @s;

	if (!defined $job->{servers} || !@{$job->{servers}}) {
		push @s, "servers";
	}

	if (!$job->{time}) {
		push @s, "time";
	}
	if (!$job->{command}) {
		push @s, "command";
	}

	if (@s) {
		crap "Missing arguments: " . join(", ", @s);
		return;
	}
	my $tfunc = $job->{recurring} ? 
		\&timeout_add: \&timeout_add_once;

	my $id = push(@jobs, $job) - 1;
	$job->{tag} = &$tfunc($job->{time} * 1000, \&execute_job, $id);
	crap "Added $id";
};

command_bind "$IRSSI{name} delete" => sub {
	my ($id, $server, $witem) = @_;

	if ($id eq '') {
		crap "Missing argument: id";
		return;
	}

	if ($id !~ /^\d+$/) {
		crap "Not a numeric id: $id";
		return;
	}

	if (!defined $jobs[$id]) {
		crap "Not a job id: $id";
		return;
	}

	timeout_remove($jobs[$id]->{tag});
	splice @jobs, $id, 1;
	crap "Deleted $id";
};

command_bind "$IRSSI{name} list" => sub {
	if (@jobs) {
		for my $i (0 .. $#jobs) {
			Irssi::print "$i => $jobs[$i]->{command}";
		}
	} else {
		crap "No jobs";
	}
};

signal_add_first "default command $IRSSI{name}" => sub {
	my ($args, $server, $item) = @_;
	Irssi::print Dumper \@_;
};

