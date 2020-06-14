import 'package:carry/utils/prefs.dart';
import 'package:flutter/material.dart';

class Arrival extends StatefulWidget {
  @override
  _ArrivalState createState() => _ArrivalState();
}

class _ArrivalState extends State<Arrival> {
  String depLat = "";
  String depLong = "";
  @override
  void initState() {
    getCoordinates('depLat').then(updateDepLat);
    getCoordinates('depLong').then(updateDepLong);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LAT : $depLat | LONG : $depLong"),
      ),
    );
  }

  void updateDepLat(String value) {
    setState(() {
      this.depLat = value;
    });
  }

  void updateDepLong(String value) {
    setState(() {
      this.depLong = value;
    });
  }
}
