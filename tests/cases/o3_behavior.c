static int step(int x) {
    switch (x & 7) {
    case 0:
        return x + 3;
    case 1:
        return x * 2 - 1;
    case 2:
        return x - 5;
    case 3:
        return x + 11;
    case 4:
        return x ^ 0x55;
    case 5:
        return x / 3 + 7;
    default:
        return x + 1;
    }
}

int main(void) {
    volatile int seed = 37;
    int acc = 0;

    for (int i = 0; i < seed; ++i) {
        int v = step(i + acc);

        if ((v & 1) == 0) {
            acc += v / 2;
        } else {
            acc -= v;
            acc += i * 3;
        }

        if (i % 5 == 0)
            acc ^= i;
        if (acc > 200)
            acc -= 73;
    }

    return acc == 71 ? 0 : acc;
}
