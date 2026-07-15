package org.raghav.springdatajpa;

import org.raghav.springdatajpa.model.Country;
import org.raghav.springdatajpa.service.CountryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class SpringDataJpaHandsonApplication {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(SpringDataJpaHandsonApplication.class);

    public static void main(String[] args) {

        ApplicationContext context =
                SpringApplication.run(SpringDataJpaHandsonApplication.class, args);

        LOGGER.info("Inside main");

        CountryService countryService =
                context.getBean(CountryService.class);

        testGetAllCountries(countryService);
    }

    private static void testGetAllCountries(CountryService countryService) {

        LOGGER.info("----- Get All Countries -----");

        List<Country> countries =
                countryService.getAllCountries();

        countries.forEach(country ->
                LOGGER.info("{}", country));

        LOGGER.info("-----------------------------");
    }
}