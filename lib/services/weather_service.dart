import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.weatherapi.com/v1';

  String apiKey = 'cd43234c64ec48c48d5225147250905';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3',
    );
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}

//   Future<WeatherModel> getWeather({required String cityName}) async {
//     Uri url = Uri.parse(
//       '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
//     );

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return WeatherModel.fromJson(data);
//     } else {
//       print('Error response: ${response.body}');
//       final errorData = jsonDecode(response.body);
//       throw Exception(errorData['error']['message'] ?? 'Unknown error');
//     }
//   }
// }
