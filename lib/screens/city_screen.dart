import 'dart:developer';

import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide.none),
                  icon: Icon(Icons.location_city, color: Colors.black87, size: 40.0),
                ),
                onChanged: (value) {
                  setState(() {
                    cityName = value;
                    log(cityName);
                  });
                },
              ),
            ),
            TextButton(
              child: const Text(
                'CHECK THE WEATHER',
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, cityName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
