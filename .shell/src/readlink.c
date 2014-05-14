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

/* TODO:
 * 	* loop detection - w/ list of paths?
 * 		- SYMLOOP_MAX
 */

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

/* use as branch, inline error messages */
char *actualpath (char *path, char *resolved) {
	char tmp[PATH_MAX], next[PATH_MAX];

	size_t i;
	ssize_t r;

	if (!resolved) {
		if (!(resolved = malloc(PATH_MAX))) {
			return NULL;
		}
	}


	if (*stpncpy(next, path, sizeof next) != '\0') {
		errno = ENAMETOOLONG;
		return NULL;
	}

	/* TODO: dirname/basename splitter */
	for (i = 0; i < SYMLOOP_MAX; i++) {

		strncpy(tmp, next, sizeof tmp);

		if (chdir(dirname(tmp)) < 0) {
			return NULL;
		}

		getcwd(resolved, PATH_MAX);
	       	strncat(resolved, "/", 2);
		strncat(resolved, basename(next), PATH_MAX);

		r = readlink(resolved, next, sizeof next);

		if (r < 0) {
			if (errno == EINVAL) {
				errno = 0;
				return resolved;
			}
			return NULL;
		}

		next[r] = '\0';
	}

	errno = ELOOP;
	return NULL;
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
		r = -(actualpath(argv[optind], resolved) == NULL);

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

