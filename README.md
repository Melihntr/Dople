Dople 🌍

Dople is a geography guessing game!
You are shown a random location using Google Maps, and your challenge is to:

Guess the country.

(Bonus round) Guess the capital city.

Sharpen your world knowledge — one pin at a time!

Tech Stack

Layer	Technology
Backend	Spring Boot
Frontend	React.js
Database	PostgreSQL
Map Display	Google Maps JavaScript API
Setup Instructions

1. Clone the Repository
git clone https://github.com/Melihntr/Dople.git
cd dople
2. Backend Setup (Spring Boot)
Navigate to the backend directory:

cd backend
Configure your application.properties (or application.yml) with your PostgreSQL database credentials and Google Maps API key:

properties
spring.datasource.url=jdbc:postgresql://localhost:5432/dople
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password

# Optional: if you're exposing API key from backend
google.maps.api.key=your_google_maps_api_key
Run the backend:


./mvnw spring-boot:run
or if you use Gradle:


./gradlew bootRun
3. Frontend Setup (React)
Navigate to the frontend directory:


cd ../frontend
Install dependencies:


npm install
Create a .env file in the frontend folder:


REACT_APP_GOOGLE_MAPS_API_KEY=your_google_maps_api_key
REACT_APP_BACKEND_URL=http://localhost:8080
Start the React app:
npm start

Google Maps API Key Warning ⚠️
The Google Maps API key is required to load map views.

Your key may expire or hit usage limits if billing is not set up.

If the map does not load:

Make sure the API key is valid.

Set up a billing account on Google Cloud.

Restrict your key to only the necessary APIs (like Maps JavaScript API).

👉 Learn more about API key management

How to Play 🎮
A random coordinate appears on Google Maps.

Guess the country it belongs to.

(Bonus) Guess the capital city for extra points!

Submit your answer and see how close you were.

