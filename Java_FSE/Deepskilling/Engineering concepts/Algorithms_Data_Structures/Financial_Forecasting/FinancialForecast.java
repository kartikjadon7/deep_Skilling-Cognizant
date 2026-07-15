package Financial_Forecasting;

public class FinancialForecast {

    public static double calculateFutureValue(double presentValue, double growthRate, int years) {

        // Base Case
        if (years == 0) {
            return presentValue;
        }

        // Recursive Call
        return calculateFutureValue(presentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {

        double presentValue = 10000;
        double growthRate = 0.10;
        int years = 5;

        double futureValue = calculateFutureValue(presentValue, growthRate, years);

        System.out.printf("Present Value : %.2f%n", presentValue);
        System.out.printf("Growth Rate   : %.0f%%%n", growthRate * 100);
        System.out.println("Years         : " + years);
        System.out.printf("Future Value  : %.2f%n", futureValue);
    }
}