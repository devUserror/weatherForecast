import 'dart:convert';
import 'package:weather_forecast_app/utilities/constants.dart';

WeatherForecast weatherFromJson(String str) =>
    WeatherForecast.fromJson(json.decode(str));

class WeatherForecast {
  final City? city;
  final String? cod;
  final double? message;
  final int? cnt;
  final List<WeatherList>? list;

  WeatherForecast({this.city, this.cod, this.message, this.cnt, this.list});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
          city: City.fromJson(json['city']),
          cnt: json['cnt'],
          cod: json['cod'],
          message: json['message'],
          list: List<WeatherList>.from(
              json['list'].map((x) => WeatherList.fromJson(x))));
}

class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone});

  factory City.fromJson(Map<String, dynamic> json) => City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone']);
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

class WeatherList {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final List<Weather>? weather;
  final double? speed;
  final int? deg;
  final double? gust;
  final int? clouds;
  final double? pop;
  final double? rain;

  WeatherList(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.pop,
      this.rain});

  factory WeatherList.fromJson(Map<String, dynamic> json) => WeatherList(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        temp: Temp.fromJson(json['temp']),
        feelsLike: FeelsLike.fromJson(json['feels_like']),
        pressure: json['pressure'],
        humidity: json['humidity'],
        weather:
            List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
        speed: json['speed'].toDouble(),
        deg: json['deg'],
        gust: json['gust'].toDouble(),
        clouds: json['clouds'],
        pop: json['pop'].toDouble(),
        rain: json['rain'],
      );

  String getIconUrl() {
    return '${Constants.WEATHER_IMAGES_URL}${weather![0].icon}.png';
  }
}

class Temp {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json['day'].toDouble(),
        min: json['min'].toDouble(),
        max: json['max'].toDouble(),
        night: json['night'].toDouble(),
        eve: json['eve'].toDouble(),
        morn: json['morn'].toDouble(),
      );
}

class FeelsLike {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json['day'].toDouble(),
        night: json['night'].toDouble(),
        eve: json['eve'].toDouble(),
        morn: json['morn'].toDouble(),
      );
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      id: json['id'],
      main: json['main'],
      description: json['main'],
      icon: json['icon']);
}
