package org.raghav.springdatajpa.repository;

import org.raghav.springdatajpa.model.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository
        extends JpaRepository<Country, String> {
}