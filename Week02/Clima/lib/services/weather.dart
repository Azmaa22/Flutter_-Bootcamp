import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const weatherBaseUrl ='https://api.openweathermap.org/data/2.5/weather';
const String apiKey = '97b458bdb5cb524175c6214dba9f1a69';

class WeatherModel {
  Future<dynamic> getWeatherCity(String cityName)async {

    NetworkHelper networkHelper = NetworkHelper(
        url: Uri.parse(
            '$weatherBaseUrl?&q=$cityName&appid=$apiKey&units=metric'));
    var data = await networkHelper.getWeatherData();
    print('Data $data');
    return data;
  }
  Future<dynamic> getWeatherLocation()async {
    Location location = new Location();
    double lat, lon;
    await location.getCurrentLocation();
    lat =  location.getLatitude();
    lon = location.getLongitude();
    NetworkHelper networkHelper = NetworkHelper(
        url: Uri.parse(
            '$weatherBaseUrl?&lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    var data = await networkHelper.getWeatherData();
    print('Data $data');
    return data;
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
