import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();

  Future getNetworkData2(String cityName) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': '38190e8933afffc02842b922c74583a2'
    });
    var response = await http.get(url);
    String data = response.body;
    if (response.statusCode == 200)
      return jsonDecode(data);
    else
      print(response.statusCode);
  }

  Future getNetworkData(double latitude, double longitude) async {
    print('lat: ${latitude} lon: ${longitude}');
    var url2 = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': '38190e8933afffc02842b922c74583a2'
    });
    var response = await http.get(url2);
    // print('url**${url}');
    // var url = Uri.https('https://api.openweathermap.org/data/2.5/weather?lat=30.3518959&lon=76.3608381&appid=38190e8933afffc02842b922c74583a2&units=metric');
    // var response = await http.get(url);
    // print('%${response}');
    // print('***${res}');
    String data = response.body;
    if (response.statusCode == 200)
      return jsonDecode(data);
    else
      print(response.statusCode);
  }
}
