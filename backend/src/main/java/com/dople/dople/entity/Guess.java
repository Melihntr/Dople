package com.dople.dople.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Guess {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long gameId; // Optional if you want to support multi-round games
    private String playerGuess;
    private double distance;
    private int guessNumber;

    @ManyToOne
    @JoinColumn(name = "country_id", nullable = false)
    private Country correctCountry;
}
