package com.dople.dople.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dople.dople.entity.Country;
import com.dople.dople.entity.Guess;
import com.dople.dople.service.GameService;

@RestController
@RequestMapping("/api/game")
@CrossOrigin(origins = "http://localhost:3000")
public class GameController {

    @Autowired
    private GameService gameService;

    private Country currentCountry;
    private int guessNumber = 0;

    @GetMapping("/start")
    public Country startGame() {
        currentCountry = gameService.getRandomCountry();
        guessNumber = 0;
        return currentCountry;
    }

    @PostMapping("/guess")
    public String submitGuess(@RequestParam String playerGuess) {
        if (currentCountry == null) {
            throw new IllegalStateException("Game has not started yet.");
        }
        guessNumber++;
        Guess guess = gameService.saveGuess(playerGuess, currentCountry, guessNumber);

        if (guess.getDistance() == 0) {
            return "Correct Guess!" +" Distance: " + Math.round(guess.getDistance())+ " km.";
        }

        return "Wrong! Distance: " + Math.round(guess.getDistance()) + " km.";
    }

    @GetMapping
    public List<String> getAllCountryNames() {
        return gameService.getAllCountries()
                             .stream()
                             .map(Country::getName)
                             .toList();
    }
}
        