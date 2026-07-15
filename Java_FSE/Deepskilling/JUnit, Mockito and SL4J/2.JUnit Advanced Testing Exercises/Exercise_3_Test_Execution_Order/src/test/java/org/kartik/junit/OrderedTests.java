package org.raghav.junit;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class OrderedTests {

    @Test
    @Order(1)
    void login() {
        System.out.println("Step 1 : Login");
    }

    @Test
    @Order(2)
    void searchProduct() {
        System.out.println("Step 2 : Search Product");
    }

    @Test
    @Order(3)
    void addToCart() {
        System.out.println("Step 3 : Add To Cart");
    }

    @Test
    @Order(4)
    void payment() {
        System.out.println("Step 4 : Payment");
    }

    @Test
    @Order(5)
    void logout() {
        System.out.println("Step 5 : Logout");
    }
}