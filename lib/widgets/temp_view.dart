import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            snapshot.data!.list![0].getIconUrl(),
            scale: 0.4,
          ),
          SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Text(
                '${snapshot.data!.list![0].temp!.day!.toStringAsFixed(0)}°C',
                style: TextStyle(
                  fontSize: 54.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                snapshot.data!.list![0].weather![0].description!.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
