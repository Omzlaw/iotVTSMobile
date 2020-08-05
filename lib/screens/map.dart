import 'package:flutter/material.dart';
import 'package:iotvts/models_and_widgets/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iotvts/services/firebase_CRUD.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

StreamSubscription<Event> refSub;

class Map extends StatefulWidget {
  static String id = 'm';

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  var latitude;
  var longitude;
  FirebaseOp firebaseOp = FirebaseOp();
  Set<Marker> markers = {};
  GoogleMapController mapController;
  LatLng _center = LatLng(9.072264, 7.491302);
  StreamSubscription<Event> refSub;

  @override
  void initState() {
    super.initState();
    firebaseOp.setRef();
    refSub = firebaseOp.refData().onChildChanged.listen(
      (Event event) {
        checkForChange(event);
      },
    );
    getLatLong();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(Marker(
          markerId: MarkerId('1'), position: LatLng(9.072264, 7.491302)));
    });
  }

  void getLatLong() {
    firebaseOp.refData().once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        if (k == 'Latitude') {
          setState(() {
            latitude = v;
          });
        }
        if (k == 'Longitude') {
          setState(() {
            longitude = v;
          });
        }
      });
    });
  }

  void setMarkerAndCenter() {
    markers.clear();
    setState(() {
      markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(double.parse(latitude), double.parse(longitude))));
    });
    mapController.moveCamera(CameraUpdate.newLatLng(
        LatLng(double.parse(latitude), double.parse(longitude))));
  }

  void checkForChange(Event event) {
    if (event.snapshot.key == 'Latitude') {
      setState(() {
        latitude = event.snapshot.value;
      });
    }
    if (event.snapshot.key == 'Longitude') {
      setState(() {
        longitude = event.snapshot.value;
      });
    }
    setMarkerAndCenter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Map', FontAwesomeIcons.mapMarkerAlt),
      bottomNavigationBar: buildBottomAppBar('Map'),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GoogleMap(
                markers: markers,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    refSub.cancel();
  }
}
