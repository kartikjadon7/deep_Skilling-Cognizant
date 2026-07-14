package org.raghav;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    Calculator calculator = new Calculator();

    @Test
    void testAdd(){
        assertEquals(5, calculator.add(2,3));
    }

    @Test
    void testSubtract(){
        assertEquals(2, calculator.subtract(5,3));
    }

}