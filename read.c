#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int open_and_read_file(char *file) {
    FILE *mp3_file = fopen(file, "r");
    if (mp3_file == NULL) {
        perror("fopen error");
        return -1;
    }
    if (fclose(mp3_file) != 0) {
        perror("fclose error");
        return -1;
    }
    return 0;
}
