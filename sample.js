function fibonacci(n) {
    let a = 0, b = 1;
    for (let i = 0; i < n; i++) {
        process.stdout.write(a + " ");
        [a, b] = [b, a + b];
    }
}

fibonacci(50);
