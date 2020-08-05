import 'package:flutter/material.dart';
import 'package:iotvts/screens/vehicle_stats.dart';
import 'package:iotvts/screens/download_image.dart';
import 'package:iotvts/screens/trigger_state.dart';
import 'package:iotvts/screens/map.dart';

void main() {
  runApp(IoTVTS());
}

class IoTVTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: VehicleStats.id,
      routes: {
        VehicleStats.id: (context) => VehicleStats(),
        Map.id: (context) => Map(),
        TriggerState.id: (context) => TriggerState(),
        DownloadImage.id: (context) => DownloadImage(),
      },
    );
  }
}
