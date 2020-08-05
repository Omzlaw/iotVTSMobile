import 'package:flutter/material.dart';
import 'package:iotvts/models_and_widgets/screen_arguments.dart';
import 'package:iotvts/models_and_widgets/app_bar.dart';
import 'package:iotvts/models_and_widgets/layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TriggerState extends StatelessWidget {
  static String id = 'ts';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: buildAppBar(
            args.title == 'Engine' ? 'Engine' : 'Door',
            args.title == 'Engine'
                ? FontAwesomeIcons.car
                : FontAwesomeIcons.lock),
        bottomNavigationBar:
            buildBottomAppBar(args.title == 'Engine' ? 'Engine' : 'Door'),
        body: MyLayout(args.title == 'Engine' ? 'Engine' : 'Door'));
  }
}
