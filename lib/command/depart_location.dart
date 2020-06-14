import 'package:carry/command/arrival.dart';
import 'package:carry/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

class Departure extends StatefulWidget {
  @override
  _DepartureState createState() => _DepartureState();
}

class _DepartureState extends State<Departure> {
  //Position currentPosition;
  static const kGoogleApiKey = "AIzaSyDzQf8HuStoQgGIHtKNRdOgjn-43oZDnRk";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        automaticallyImplyLeading: true,
        title: Text(
          'Faire une commande',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
              child: Text(
                'Quelle votre adresse de départ ?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
                leading: Icon(IcoFontIcons.locationPin),
                title: Text('Adresse actuelle'),
                onTap: () {
                  addCoordinates('depLat', currentPosition.latitude);
                  addCoordinates('depLong', currentPosition.longitude);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Arrival()));
                }),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Divider(),
            ),
            ListTile(
              leading: Icon(
                IcoFontIcons.search,
                size: 21,
              ),
              title: Text('Entrer une autre adresse'),
              onTap: () async {
                Prediction p = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    mode: Mode.overlay, // Mode.fullscreen
                    language: "fr",
                    components: [Component(Component.country, "tg")]);
                displayPrediction(p).then((value) => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Arrival())));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      print(lat);
      print(lng);
      addCoordinates('depLat', lat);
      addCoordinates('depLong', lng);
    }
  }

  /*_getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        addCoordinates('depLat', currentPosition.latitude);
        addCoordinates('depLong', currentPosition.longitude);
      });
    }).catchError((e) {
      print(e);
    });
  }*/
}
