class DivisionWithoutOperators {
    public static void main(String[] args) {
        int dividend = 23, divisor = 5;
        int quotient = 0;
        while (dividend >= divisor) {
            dividend -= divisor;
            quotient++;
        }
        System.out.println("Quotient: " + quotient + ", Remainder: " + dividend);
    }
}
