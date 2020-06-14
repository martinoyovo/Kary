import 'package:carry/dash.dart';
import 'package:carry/services/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locationService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (_) => locationService.getLocation(),
      child: MaterialApp(
        title: 'Kary',
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.lightBlue,
            backgroundColor: Colors.grey.shade200),
        home: Dash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
