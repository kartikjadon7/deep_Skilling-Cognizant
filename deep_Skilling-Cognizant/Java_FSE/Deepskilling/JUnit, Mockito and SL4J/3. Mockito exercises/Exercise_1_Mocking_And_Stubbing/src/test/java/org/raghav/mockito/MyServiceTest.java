package org.raghav.mockito;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    void testExternalApi() {

        // Create Mock Object
        ExternalApi mockApi = mock(ExternalApi.class);

        // Stub the Method
        when(mockApi.getData()).thenReturn("Mock Data");

        // Inject Mock into Service
        MyService service = new MyService(mockApi);

        // Call Service Method
        String result = service.fetchData();

        // Verify Result
        assertEquals("Mock Data", result);

    }
}