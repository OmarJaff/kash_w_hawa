import 'package:KashWHawa/services/location.dart';
import 'package:KashWHawa/services/networking.dart';

const apiKey = 'a382eb8e2fef8e0b6f1cb8537e0daf01';
const openWeatherMapURI = 'https://api.openweathermap.org/data/2.5/onecall';
const searchByCityURI = 'https://api.openweathermap.org/data/2.5/weather';

String language = 'en';
String unit = 'metric';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        '$searchByCityURI?q=$cityName&appid=$apiKey&lang=$language&units=$unit');
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCurrentLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper(
        '$openWeatherMapURI?lat=${location.latitude}&lon=${location.longitude}&lang=$language&exclude=minutely&appid=$apiKey&units=$unit');
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  String getWeatherImage(String iconCode) {
    switch (iconCode) {
      case '01d':
        return 'assets/images/clear-day.png';
        break;
      case '01n':
        return 'assets/images/clean-night.png';
        break;
      case '02d':
      case '02n':
        return 'assets/images/few-clouds.png';
        break;
      case '03d':
      case '03n':
        return 'assets/images/scattered-clouds.png';
        break;
      case '04d':
      case '04n':
        return 'assets/images/broken-clouds.png';
        break;
      case '09d':
      case '09n':
        return 'assets/images/shower.png';
        break;
      case '10d':
        return 'assets/images/rain-day.png';
        break;
      case '10n':
        return 'assets/images/rain-night.png';
        break;
      case '11d':
      case '11n':
        return 'assets/images/thunder.png';
        break;
      case '13d':
      case '13n':
        return 'assets/images/snowy.png';
        break;
      default:
        return 'assets/images/broken-clouds.png';
      break;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
