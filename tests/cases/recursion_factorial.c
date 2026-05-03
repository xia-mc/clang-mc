static int fact(int n) {
    if (n <= 1)
        return 1;
    return n * fact(n - 1);
}

int main(void) {
    return fact(6) == 720 ? 0 : 101;
}
