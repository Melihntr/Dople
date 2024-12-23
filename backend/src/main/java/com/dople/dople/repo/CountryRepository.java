package com.dople.dople.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dople.dople.entity.Country;

@Repository
public interface CountryRepository extends JpaRepository<Country, Long> { }