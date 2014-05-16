/* BSD readlink clone, blame http://github.com/jgrar/dotfiles
 *
 * POSIX (http://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.html)
 * provides no readlink utility, but it does provide it in basedefs/functions
 * http://pubs.opengroup.org/onlinepubs/9699919799/functions/readlink.html .
 * This is a clone for those systems that don't have a readlink utility.
 * Most platforms do have one though and it shouldn't be necessary to ever use this.
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <errno.h>
#include <string.h>
#include <limits.h>

#ifndef SYMLOOP_MAX
# define SYMLOOP_MAX _POSIX_SYMLOOP_MAX
#endif

#include <libgen.h>
#include <unistd.h>
extern int optind, optopt;

#define PROGRAM_NAME "readlink"

#define USAGE "usage: [-fn] file\n"

void usage (FILE *out, int status, char *message, ...) {
	va_list ap;

	if (message) {
		va_start(ap, message);
		vfprintf(out, message, ap);
		va_end(ap);
	}

	fputs(USAGE, out);

	exit(status);
}

/* This is realpath(3) without automatic allocation of the second parameter,
 * it just isn't necessary to do that. Returns < 0 on failure, 0 on success
 * everything else should be assumed to match the behaviour of realpath
 */
int actualpath (char *path, char *resolved) {
	char next[PATH_MAX], *p;

	size_t i;
	ssize_t r;

	if (*stpncpy(next, path, sizeof next) != '\0') {
		errno = ENAMETOOLONG;
		return -1;
	}

	for (i = 0; i < SYMLOOP_MAX; i++) {

		p = strrchr(next, '/');

		if (p) {
			p++;

			if (chdir(dirname(next)) < 0) {
				return -1;
			}
		} else {
			p = next;
		}

		getcwd(resolved, PATH_MAX);

		if (*p) {
		       	strncat(resolved, "/", 2);
			strncat(resolved, p, PATH_MAX);
		}

		r = readlink(resolved, next, sizeof next);

		if (r < 0) {
			if (errno == EINVAL) {
				errno = 0;
				return 0;
			}
			return -1;
		}

		next[r] = '\0';
	}

	errno = ELOOP;
	return -1;
}

static int follow = 0;
static int newline = 1;

int main (int argc, char *argv[]) {

	char resolved[PATH_MAX];
	ssize_t r;

	int c;

	while ((c = getopt(argc, argv, ":fn")) != -1) {
		switch (c) {
			case 'f':
				follow = 1;
				break;
			case 'n':
				newline = 0;
				break;
			case '?':
				usage(stderr,
					EXIT_FAILURE,
					PROGRAM_NAME": unknown option: -%c\n",
					optopt
				);
				break;
		}
	}

	if (optind >= argc) {
		usage(stderr, EXIT_FAILURE, NULL);
	}

	if (follow) {
		r = actualpath(argv[optind], resolved);

	} else {
		r = readlink(argv[optind], resolved, sizeof resolved);

		if (r >= 0) {
			resolved[r] = '\0';
		}
	}

	if (r < 0) {
		fprintf(stderr, PROGRAM_NAME": error resolving '%s': %s\n",
			argv[optind], strerror(errno)
		);
		exit(EXIT_FAILURE);
	}

	fputs(resolved, stdout);

	if (newline) {
		fputc('\n', stdout);
	}

	exit(EXIT_SUCCESS);
}

