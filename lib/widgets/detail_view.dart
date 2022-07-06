import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast_app/utilities/forecast_util.dart';
import '../models/weather_forecast_daily.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.temperatureThreeQuarters,
              snapshot.data!.list![0].pressure! * 0.750062.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain,
              snapshot.data!.list![0].humidity!, '%'),
          Util.getItem(FontAwesomeIcons.wind,
              snapshot.data!.list![0].speed!.toInt(), 'm / s'),
        ],
      ),
    );
  }
}
