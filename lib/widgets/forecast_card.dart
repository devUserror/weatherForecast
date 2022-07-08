import 'package:flutter/material.dart';
import '../utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var dayOfWeek = '';
  var fullDate = Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(
      snapshot.data!.list![index].dt * 1000));
  dayOfWeek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${snapshot.data!.list![index].temp.min.toStringAsFixed(0)}°C',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.network(snapshot.data!.list![index].getIconUrl(), scale: 1.2),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
