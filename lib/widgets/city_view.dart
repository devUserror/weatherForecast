import 'package:flutter/material.dart';
import 'package:weather_forecast_app/models/weather_forecast_daily.dart';
import 'package:weather_forecast_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    // var forecastList = snapshot.data!.list;
    // ??Как избавить от этой переменной??
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list![0].dt! * 1000);
    return Column(
      children: <Widget>[
        Text(
          '${snapshot.data!.city!.name}, ${snapshot.data!.city!.country}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black87,
          ),
        ),
        Text(
          // ??И вывести сюда??
          Util.getFormattedDate(formattedDate),
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
