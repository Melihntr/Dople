// src/components/Game.js
import React, { useState, useEffect } from "react";
import axios from "axios";

const Game = () => {
  const [country, setCountry] = useState(null);
  const [playerGuess, setPlayerGuess] = useState("");
  const [feedback, setFeedback] = useState("");
  const [guesses, setGuesses] = useState([]);

  // Fetch the random country when the game starts
  useEffect(() => {
    axios.get("http://localhost:8080/api/game/start").then((response) => {
      setCountry(response.data);
    });
  }, []);

  // Handle submitting a guess
  const handleGuess = () => {
    if (!playerGuess) {
      alert("Please enter a guess!");
      return;
    }

    axios
      .post(`http://localhost:8080/api/game/guess`, null, {
        params: { playerGuess },
      })
      .then((response) => {
        setFeedback(response.data);
        setGuesses([...guesses, playerGuess]);
        setPlayerGuess("");
      })
      .catch((error) => {
        console.error("Error submitting guess:", error);
      });
  };

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>GeoGuessr Wordle</h1>

      {country ? (
        <>
          <h2>Street View: Guess the Country!</h2>
          {/* Embed Google Street View */}
          <iframe
            title="Street View"
            width="600"
            height="400"
            src={`https://www.google.com/maps/embed/v1/streetview?key=AIzaSyBFUfBR5rTQtLEyNyMWDRwM4gFdUpgrkp8&location=${country.latitude},${country.longitude}`}
            allowFullScreen
          ></iframe>

          <div>
            <input
              type="text"
              placeholder="Enter your guess (country name)"
              value={playerGuess}
              onChange={(e) => setPlayerGuess(e.target.value)}
            />
            <button onClick={handleGuess}>Submit Guess</button>
          </div>

          {feedback && <p style={{ marginTop: "20px" }}>{feedback}</p>}

          <div>
            <h3>Your Previous Guesses:</h3>
            <ul>
              {guesses.map((guess, index) => (
                <li key={index}>{guess}</li>
              ))}
            </ul>
          </div>
        </>
      ) : (
        <p>Loading game...</p>
      )}
    </div>
  );
};

export default Game;