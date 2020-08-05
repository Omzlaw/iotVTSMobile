import 'package:flutter/material.dart';
import 'package:iotvts/screens/trigger_state.dart';
import 'package:iotvts/models_and_widgets/buttons.dart';
import 'package:iotvts/screens/download_image.dart';
import 'package:iotvts/screens/map.dart';
import 'package:iotvts/screens/vehicle_stats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar buildAppBar(String currentScreen, IconData icon) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Color(0xfff5a8a8),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'IoT VTS App: $currentScreen',
          style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
        ),
      ],
    ),
  );
}

BottomAppBar buildBottomAppBar(String currentScreen) {
  return BottomAppBar(
    color: Colors.white,
    child: Container(
      height: 50.0,
      color: Colors.white,
      child: Row(
        children: [
          Buttons('Stats', VehicleStats.id, FontAwesomeIcons.chartLine,
              currentScreen),
          Buttons(
              'Engine', TriggerState.id, FontAwesomeIcons.car, currentScreen),
          Buttons(
              'Door', TriggerState.id, FontAwesomeIcons.lock, currentScreen),
          Buttons('Map', Map.id, FontAwesomeIcons.mapMarkerAlt, currentScreen),
          Buttons(
              'Image', DownloadImage.id, FontAwesomeIcons.image, currentScreen),
        ],
      ),
    ),
  );
}
