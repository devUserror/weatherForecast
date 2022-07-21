import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(snapshot.data!.list![0].getIconUrl(), scale: 0.35),
        const SizedBox(width: 20.0),
        Column(
          children: <Widget>[
            Text(
              '${snapshot.data!.list![0].temp!.day!.toStringAsFixed(0)}°C',
              style: const TextStyle(
                fontSize: 60.0,
                color: Colors.black87,
              ),
            ),
            Text(
              snapshot.data!.list![0].weather![0].description!.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


