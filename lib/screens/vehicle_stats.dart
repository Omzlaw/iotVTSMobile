import 'package:flutter/material.dart';
import 'package:iotvts/models_and_widgets/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotvts/models_and_widgets/layout.dart';

class VehicleStats extends StatelessWidget {
  static String id = 'vs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Stats', FontAwesomeIcons.chartLine),
      bottomNavigationBar: buildBottomAppBar('Stats'),
      body: MyLayout('stats'),
    );
  }
}
