int main(void) {
    int acc = 0;

    for (int i = 1; i < 18; ++i) {
        int inner = 0;
        for (int j = 0; j < i; ++j)
            inner += (i ^ j) - (j & 3);

        if (i & 1)
            acc += inner;
        else
            acc -= inner / 2;
    }

    return acc == 377 ? 0 : acc;
}
