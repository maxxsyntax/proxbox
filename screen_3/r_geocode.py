#!/usr/bin/python
#need for ssid2city-LocalWigle
import sys
from geopy.geocoders import Nominatim
#print("Hello from Python script!")
def reverse_geocode_coordinates(latitude, longitude):
    geolocator = Nominatim(user_agent="reverse_geocode_script")
    location = geolocator.reverse((latitude, longitude), language='en')
    return location.address if location else "Location not found."

if __name__ == "__main__":
    # Check if the correct number of command line arguments is provided
    if len(sys.argv) != 3:
#        print("Usage: python script.py <latitude> <longitude>")
        sys.exit(1)

    # Parse command line arguments as floats
    try:
        latitude = float(sys.argv[1])
        longitude = float(sys.argv[2])
    except ValueError:
        print("Error: Latitude and longitude must be valid floating-point numbers.")
        sys.exit(1)

    # Perform reverse geocoding
    result = reverse_geocode_coordinates(latitude, longitude)

    # Print the result
#    print("Reverse Geocoding Result:")
    print(result)
