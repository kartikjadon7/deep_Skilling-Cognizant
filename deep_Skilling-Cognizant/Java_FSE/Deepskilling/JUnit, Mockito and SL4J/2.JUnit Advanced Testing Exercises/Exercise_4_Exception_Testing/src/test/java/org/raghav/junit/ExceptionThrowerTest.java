package org.raghav.junit;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class ExceptionThrowerTest {

    ExceptionThrower exceptionThrower = new ExceptionThrower();

    @Test
    void testThrowException() {

        assertThrows(
                IllegalArgumentException.class,
                () -> exceptionThrower.throwException()
        );

    }
}