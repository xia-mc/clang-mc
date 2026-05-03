#include <stdio.h>
#include <string.h>

int main(void) {
    char buf[64];
    int n = -1;
    int r = snprintf(buf, sizeof(buf), "%08x %c %s%n", 0x2a, 'A', "done", &n);

    if (r != 15)
        return 101;
    if (n != 15)
        return 102;
    if (strcmp(buf, "0000002a A done") != 0)
        return 103;

    return printf("Hello, %s!\n", "World") == 14 ? 0 : 104;
}
