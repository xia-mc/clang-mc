#include <minecraft.h>

int main(void) {
    McfString s;

    s = McfString_FromLiteral("{\"text\":\"q\"}");
    if (s == 0)
        return 100;

    return 0;
}
