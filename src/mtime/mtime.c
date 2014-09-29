
/* Print file modification time
 */
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>

#define DEFAULT_FORMAT "%s"

void usage (int status) {
	fprintf(status != EXIT_SUCCESS ? stderr: stdout,
		"usage modtime [options] FILE...\n"
		"\t-f [format]\n"
		"\t\tspecify time format string, see strftime(3)\n"
		"\t-h\n"
		"\t\tdisplay this help message\n"
	);
	exit(status);
}

int main (int argc, char *argv[]) {

	int opt, i, r;
	char *format = DEFAULT_FORMAT, buf[BUFSIZ] = {0};
	struct stat stbuf;
	struct tm *tm;

	while ((opt = getopt(argc, argv, "f:h")) != -1) {
		switch (opt) {
			case 'f':
				format = optarg;
				break;

			case 'h':
				usage(EXIT_SUCCESS);
				break;
			default:
				break;
		}
	}

	for (i = optind; i < argc; i++) {
	
		r = stat(argv[i], &stbuf);

		if (r) {
			fprintf(stderr, "Could not stat \"%s\": %s\n",
				argv[i],
				strerror(errno)
			);
			exit(EXIT_FAILURE);
		}

		tm = localtime(&stbuf.st_mtime);
		strftime(buf, sizeof buf, format, tm);
		fprintf(stdout, "%11lu %s\n", strtoul(buf, NULL, 10), argv[i]);

		memset(&stbuf, 0, sizeof stbuf);
		memset(buf, 0, sizeof buf);
	}

	exit(EXIT_SUCCESS);
}
