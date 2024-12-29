import React, { useState, useEffect, useRef } from "react";
import axios from "axios";
import "./Game.css";

const Game = () => {
  const [country, setCountry] = useState(null);
  const [playerGuess, setPlayerGuess] = useState("");
  const [feedback, setFeedback] = useState("");
  const [guesses, setGuesses] = useState([]);
  const [countryList, setCountryList] = useState([]);
  const [isHowToPlayModalOpen, setIsHowToPlayModalOpen] = useState(false);
  const [isWrongGuessModalOpen, setIsWrongGuessModalOpen] = useState(false);
  const [isCorrectGuessModalOpen, setIsCorrectGuessModalOpen] = useState(false);
  const [modalMessage, setModalMessage] = useState("");
  const [wrongGuessCount, setWrongGuessCount] = useState(0);
  const maxWrongGuesses = 5;

  const streetViewRef = useRef(null);
  let panorama = useRef(null);

  // Fetch the initial random country and the list of countries
  useEffect(() => {
    fetchCountry();
    fetchCountryList();
  }, []);

  // Fetch a new random country
  const fetchCountry = () => {
    axios
      .get("http://localhost:8080/api/game/start")
      .then((response) => {
        setCountry(response.data);
        setGuesses([]);
        setFeedback("");
        setWrongGuessCount(0);

        // Initialize Street View with the new country location
        initStreetView(response.data.latitude, response.data.longitude);
      })
      .catch((error) => console.error("Error fetching country:", error));
  };

  // Fetch the list of all countries
  const fetchCountryList = () => {
    axios
      .get("http://localhost:8080/api/game")
      .then((response) => setCountryList(response.data))
      .catch((error) => console.error("Error fetching country list:", error));
  };

  // Initialize Google Maps Street View with compass and fullscreen controls
  const initStreetView = (latitude, longitude) => {
    if (streetViewRef.current) {
      panorama.current = new window.google.maps.StreetViewPanorama(streetViewRef.current, {
        position: { lat: latitude, lng: longitude },
        pov: { heading: 0, pitch: 0 },
        disableDefaultUI: true, // Enable default UI controls
        fullscreenControl: false, // Enable fullscreen control
        linksControl: false, // Disable navigation links
        motionTracking: true, // Enable motion tracking
        motionTrackingControl: false, // Disable motion tracking control
        panControl: true, // Add pan control for the compass
      });
    }
  }; 
  // Handle submitting a guess
  const handleGuess = () => {
    if (!playerGuess) {
      alert("Please enter a guess!");
      return;
    }

    axios
      .post("http://localhost:8080/api/game/guess", null, {
        params: { playerGuess },
      })
      .then((response) => {
        setFeedback(response.data);
        setGuesses([...guesses, playerGuess]);

        if (response.data.includes("Correct Guess!")) {
          setModalMessage("Congratulations! You guessed the country correctly!");
          setIsCorrectGuessModalOpen(true); // Open correct guess modal
        } else {
          setWrongGuessCount((prevCount) => {
            const newCount = prevCount + 1;
            if (newCount >= maxWrongGuesses) {
              setModalMessage("Game Over! You've used all your guesses.");
              setIsWrongGuessModalOpen(true); // Open wrong guess modal
            }
            return newCount;
          });
        }

        setPlayerGuess("");
      })
      .catch((error) => console.error("Error submitting guess:", error));
  };

  // Handle starting a new game
  const startNewGame = () => {
    setIsHowToPlayModalOpen(false);
    setIsWrongGuessModalOpen(false);
    setIsCorrectGuessModalOpen(false); // Close all modals
    fetchCountry();
  };

  return (
    <div className="game-container">
      <header className="game-header">
        <span className="game-title">Dople</span>
        <div className="header-buttons">
          <button onClick={fetchCountry}>Generate Country</button>
          <button onClick={() => setIsHowToPlayModalOpen(true)}>How to Play</button>
        </div>
      </header>

      <div className="game-box">
        {country ? (
          <>
            <h2>Street View: Guess the Country!</h2>
            <div
              ref={streetViewRef}
              style={{
                width: "750px",
                height: "450px",
                margin: "0 auto",
                borderRadius: "10px",
                border: "1px solid #ccc",
              }}
            ></div>

            <div className="guess-section">
              <input
                type="text"
                list="country-options"
                className="guess-input"
                placeholder="Enter your guess (country name)"
                value={playerGuess}
                onChange={(e) => setPlayerGuess(e.target.value)}
              />
              <datalist id="country-options">
                {countryList.map((countryName, index) => (
                  <option key={index} value={countryName} />
                ))}
              </datalist>
              <button onClick={handleGuess} className="guess-button">
                Submit Guess
              </button>
            </div>

            {feedback && <p className="feedback">{feedback}</p>}

            <div className="guess-history">
              <h3>Your Previous Guesses:</h3>
              <ul>
                {guesses.map((guess, index) => (
                  <li key={index}>{guess}</li>
                ))}
              </ul>
            </div>
          </>
        ) : (
          <p className="loading">Loading game...</p>
        )}
      </div>

      {/* Modal for how to play */}
      {isHowToPlayModalOpen && (
        <div className="modal">
          <div className="modal-content">
            <h2>How to Play</h2>
            <p>
              Welcome to Dople! Your goal is to guess the country based on the Street View image
              provided. Follow these steps:
            </p>
            <ul>
              <li>View the Street View image carefully.</li>
              <li>Type the name of the country you think it is in the guess box.</li>
              <li>Submit your guess. You'll receive feedback about how close your guess is.</li>
              <li>Keep guessing until you identify the correct country!</li>
            </ul>
            <button onClick={() => setIsHowToPlayModalOpen(false)}>Close</button>
          </div>
        </div>
      )}

      {/* Modal for wrong guess */}
      {isWrongGuessModalOpen && (
        <div className="modal">
          <div className="modal-content">
            <h2>{modalMessage}</h2>
            <button onClick={startNewGame}>Start a New Game</button>
          </div>
        </div>
      )}

      {/* Modal for correct guess */}
      {isCorrectGuessModalOpen && (
        <div className="modal">
          <div className="modal-content">
            <h2>{modalMessage}</h2>
            <button onClick={startNewGame}>Start a New Game</button>
          </div>
        </div>
      )}
    </div>
  );
};

export default Game;
