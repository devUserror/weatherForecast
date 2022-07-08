import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecast_app/api/weather_api.dart';
import 'package:weather_forecast_app/models/weather_forecast_daily.dart';
import 'package:weather_forecast_app/screens/city_screen.dart';
import 'package:weather_forecast_app/widgets/bottom_list_view.dart';
import 'package:weather_forecast_app/widgets/city_view.dart';
import 'package:weather_forecast_app/widgets/detail_view.dart';
import 'package:weather_forecast_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;

  String _cityName = 'Tyumen';
  // String _cityName;

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.location_city),
              onPressed: () async {
                var tappedName =
                    await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CityScreen();
                }));
                if (tappedName != null) {
                  //необходимо принудительно вызвать перестроение виджетов на основе новых данных
                  ///для этого юзается метод [setState]
                  setState(() {
                    _cityName = tappedName;
                    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
                  });
                }
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: 25.0),
                    CityView(snapshot: snapshot),
                    const SizedBox(height: 25.0),
                    TempView(snapshot: snapshot),
                    const SizedBox(height: 25.0),
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    BottomListView(snapshot: snapshot)
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.black87,
                    size: 100.0,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
