package com.dople.dople.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dople.dople.entity.Guess;
@Repository
public interface GuessRepository extends JpaRepository<Guess, Long> { }
