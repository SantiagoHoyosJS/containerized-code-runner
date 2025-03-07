#include <iostream>

void fibonacci(int n) {
    long long a = 0, b = 1;
    for (int i = 0; i < n; i++) {
        std::cout << a << " ";
        long long temp = a + b;
        a = b;
        b = temp;
    }
}

int main() {
    fibonacci(50);
    return 0;
}
