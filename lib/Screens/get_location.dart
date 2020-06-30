import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moverestricted();
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 233, 217, 1),
        appBar: AppBar(
          title: Text("Location"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_currentPosition != null)
                Text(
                  "ADDRESS: $_currentAddress",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.0,
                ),
              SizedBox(height: 30.0),
              RaisedButton.icon(
                color: const Color(0xFF232F34),
                textColor: Colors.amber,

                elevation: 5.0,
                onPressed: () {
                  _getCurrentLocation();
                },
                //shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                icon: Icon(
                  Icons.location_on,
                  size: 30.0,
                  color: Colors.amber,
                ),
                label: Text(
                  'Get Location',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward,
            color: Colors.redAccent,
            size: 30.0,
          ),
          backgroundColor: Color.fromRGBO(175, 200, 200, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
        ),
      ),
    );
  }

  int moverestricted() {
    return null;
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name},${place.subLocality},${place.locality},${place.postalCode},${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }
}
