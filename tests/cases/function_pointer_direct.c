typedef int (*unop_t)(int);

static int inc(int x) {
    return x + 1;
}

int main(void) {
    unop_t fn = inc;
    return fn(10) == 11 ? 0 : 101;
}
