import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  void geoLocation() async {
    Location location = Location();
    await location.getGeoLocation();
    print('Latitude: ${location.Latitude}');
    print('Longitude: ${location.Longitude}');
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var temp = decodedData['main']['temp'];
      var condId = decodedData['weather'][0]['id'];
      var city = decodedData['name'];
      print(temp);
      print(condId);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.blue[800],
    );
  }
}
