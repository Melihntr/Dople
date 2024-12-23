package com.dople.dople.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dople.dople.entity.Country;
import com.dople.dople.entity.Guess;
import com.dople.dople.repo.CountryRepository;
import com.dople.dople.repo.GuessRepository;

@Service
public class GameService {

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private GuessRepository guessRepository;

    private final Random random = new Random();

    public Country getRandomCountry() {
        List<Country> countries = countryRepository.findAll();
        return countries.get(random.nextInt(countries.size()));
    }

    public double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        final int R = 6371; // Radius of the Earth in kilometers
        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;
    }

    public Guess saveGuess(String playerGuess, Country correctCountry, int guessNumber) {
        Country guessedCountry = countryRepository.findAll().stream()
                .filter(country -> country.getName().equalsIgnoreCase(playerGuess))
                .findFirst()
                .orElse(null);

        double distance = guessedCountry == null ? Double.MAX_VALUE :
                calculateDistance(correctCountry.getLatitude(), correctCountry.getLongitude(),
                        guessedCountry.getLatitude(), guessedCountry.getLongitude());

        Guess guess = new Guess();
        guess.setPlayerGuess(playerGuess);
        guess.setCorrectCountry(correctCountry);
        guess.setDistance(distance);
        guess.setGuessNumber(guessNumber);
        return guessRepository.save(guess);
    }
}
