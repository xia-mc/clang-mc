int main(void) {
    double x = 2.5;
    double y = 1.0;
    double z = x * x - y / 2.0 + 3.0;
    int q = (int)(z * 4.0);

    if (!(z > 8.74 && z < 8.76))
        return 101;
    return q == 35 ? 0 : 102;
}
