import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter_project/services/weatherData.dart';

class WeatherService {
  Future<WeatherData> getWeatherData(String place) async {
    try {
      final queryParameters = {
        'key': '1542befc2a0f429aaa902441220912',
        'q': place,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch(e) {
      rethrow;
    }
  }
}