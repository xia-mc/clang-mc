typedef int (*unop_t)(int);

static int inc(int x) {
    return x + 1;
}

static int dbl(int x) {
    return x * 2;
}

static int apply(unop_t fn, int x) {
    return fn(x);
}

int main(void) {
    unop_t table[2] = {inc, dbl};
    unop_t chosen;
    int acc = 0;

    acc += apply(table[0], 3);
    acc += apply(table[1], 4);
    chosen = table[acc == 12 ? 0 : 1];

    if (chosen(10) != 11)
        return 101;
    return apply(chosen, -1) == 0 ? 0 : 102;
}
