import 'dart:developer';
import 'package:weather_forecast_app/models/weather_forecast_daily.dart';
import 'package:weather_forecast_app/utilities/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String cityName = 'Tyumen'}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);
    log('request: ${uri.toString()}');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      throw Exception('Error response');
    }
  }
}
