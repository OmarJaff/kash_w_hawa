import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';


class Location {
  double latitude , longitude;
  String CityName, CountryName;
  Future<void> getCurrentLocation() async {
          try {
            Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
            latitude = position.latitude;
            longitude = position.longitude;
            Coordinates coordinates = new Coordinates(latitude, longitude);
            var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
            var first = addresses.first;
            CityName = first.locality;
            CountryName = first.countryName;
          }catch(e) {
            print(e);
          }
  }
 }