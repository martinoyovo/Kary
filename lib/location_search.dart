import 'package:carry/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  String destLat = "";
  String destLong = "";
  String depLat = "";
  String depLong = "";

  GoogleMapController mapController;
  BitmapDescriptor pinLocationIcon;

  static const kGoogleApiKey = "AIzaSyDzQf8HuStoQgGIHtKNRdOgjn-43oZDnRk";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5, size: Size(2, 3)),
            'assets/icon.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
    getCoordinates('destLat').then(updateDestLat);
    getCoordinates('destLong').then(updateDestLong);
    getCoordinates('destLat').then(updateDepLat);
    getCoordinates('depLong').then(updateDepLong);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    return Scaffold(
      body: (currentPosition != null)
          ? Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          currentPosition.latitude, currentPosition.longitude),
                      zoom: 16.0),
                  onMapCreated: onMapCreated,
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: {
                    Marker(
                        markerId: MarkerId('<MARKER_ID>'),
                        position: LatLng(currentPosition.latitude,
                            currentPosition.longitude),
                        icon: pinLocationIcon)
                  },
                  //zoomControlsEnabled: true,
                ),
                Positioned(
                  top: 30.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Entrer l\'adresse',
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 26,
                        ),
                      ),
                      cursorRadius: Radius.circular(1),
                      onTap: () async {
                        Prediction p = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: kGoogleApiKey,
                            mode: Mode.overlay, // Mode.fullscreen
                            language: "fr",
                            components: [Component(Component.country, "tg")]);
                        displayPrediction(p);
                      },
                    ),
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator()),
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

  void onMapCreated(controller) {
    final currentPosition = Provider.of<Position>(context);
    setState(() {
      mapController = controller;
    });
  }

  void updateDestLat(String value) {
    setState(() {
      this.destLat = value;
    });
  }

  void updateDestLong(String value) {
    setState(() {
      this.destLong = value;
    });
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
