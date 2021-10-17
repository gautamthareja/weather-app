import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const String apiKey = '38190e8933afffc02842b922c74583a2';
const String openWeatherMapURl =
    'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> cityWeatherData({@required cityName}) async {
    NetworkHelper networkHelper = NetworkHelper();
    return await networkHelper.getNetworkData2(cityName);
  }

  Future<dynamic> locationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('latitude: ${location.latitude}   longitude: ${location.longitude}');
    NetworkHelper networkHelper = NetworkHelper();
    // print(networkHelper.url);
    // print('before getNetworkData');
    // var weatherData = {"coord":{"lon":76.3608,"lat":30.3519},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":29.03,"feels_like":27.9,"temp_min":29.03,"temp_max":29.03,"pressure":1003,"humidity":30,"sea_level":1003,"grnd_level":974},"visibility":10000,"wind":{"speed":1.72,"deg":226,"gust":1.92},"clouds":{"all":0},"dt":1634303000,"sys":{"country":"IN","sunrise":1634259383,"sunset":1634300639},"timezone":19800,"id":1260107,"name":"Patiāla","cod":200}
    var weatherData = await networkHelper.getNetworkData(location.latitude, location.longitude);
    print(weatherData);

    // print('---${weatherData}');
    // print('before returning');
    return weatherData;
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
    temp = temp - 273;
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need muffler and gloves';
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
