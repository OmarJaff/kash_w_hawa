
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a382eb8e2fef8e0b6f1cb8537e0daf01';
const openWeatherMapURI = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper('$openWeatherMapURI?q=$cityName&appid=$apiKey&units=metric');   //imperial for fahranite
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }
  
  Future<dynamic> getCurrentLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper('$openWeatherMapURI?lat=${location.latitude}&lon=${location.longitude}&lang=ar&exclude=minutely&appid=$apiKey&units=metric');
    var weatherData = await networkingHelper.getData();
//    return weatherData;
    print(weatherData);
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
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
