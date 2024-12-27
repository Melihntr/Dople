import React, { useEffect } from "react";

const StreetView = ({ country }) => {
  useEffect(() => {
    // Check if google and google.maps are loaded
    if (window.google && window.google.maps) {
      const initMap = () => {
        const streetViewLocation = new window.google.maps.LatLng(
          country.latitude,
          country.longitude
        );
        const map = new window.google.maps.Map(
          document.getElementById("street-view"),
          {
            center: streetViewLocation,
            zoom: 14,
            streetViewControl: false, // Disable the Street View control
          }
        );

        const panorama = new window.google.maps.StreetViewPanorama(
          document.getElementById("street-view"),
          {
            position: streetViewLocation,
            pov: { heading: 34, pitch: 10 }, // Adjust POV as needed
            visible: true,
            addressControl: false, // Disable the location text
            linksControl: false, // Disable navigation links
            fullscreenControl: false, // Disable fullscreen button
          }
        );

        map.setStreetView(panorama);
      };

      initMap();
    }
  }, [country]); // Re-run effect when `country` changes

  return (
    <div id="street-view" style={{ width: "600px", height: "400px" }}></div>
  );
};

export default StreetView;
