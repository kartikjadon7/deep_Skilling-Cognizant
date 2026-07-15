package E_commerce_Platform__Search_Function;

public class ECommerceSearch {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Phone", "Electronics"),
                new Product(103, "Shoes", "Fashion"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Bag", "Fashion")
        };

        Product result1 = SearchAlgorithms.linearSearch(products, 104);

        if (result1 != null)
            System.out.println("Linear Search Found: " + result1);
        else
            System.out.println("Product Not Found");

        Product result2 = SearchAlgorithms.binarySearch(products, 104);

        if (result2 != null)
            System.out.println("Binary Search Found: " + result2);
        else
            System.out.println("Product Not Found");
    }
}