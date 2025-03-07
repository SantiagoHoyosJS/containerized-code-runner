public class sample {
    public static void main(String[] args) {
        int n = 50;
        long a = 0, b = 1;
        for (int i = 0; i < n; i++) {
            System.out.print(a + " ");
            long temp = a + b;
            a = b;
            b = temp;
        }
    }
}
