static int is_odd(int n);

static int is_even(int n) {
    if (n == 0)
        return 1;
    return is_odd(n - 1);
}

static int is_odd(int n) {
    if (n == 0)
        return 0;
    return is_even(n - 1);
}

int main(void) {
    if (!is_even(24))
        return 101;
    if (!is_odd(17))
        return 102;
    if (is_even(17))
        return 103;
    return is_odd(24) ? 104 : 0;
}
