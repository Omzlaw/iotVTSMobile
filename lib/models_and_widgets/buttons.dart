import 'package:flutter/material.dart';
import 'package:iotvts/models_and_widgets/screen_arguments.dart';

class Buttons extends StatelessWidget {
  final String text;
  final String screenId;
  final IconData icon;
  final String currentScreen;

  Buttons(this.text, this.screenId, this.icon, this.currentScreen);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 4),
        child: FlatButton(
          color: Colors.white,
          child: Column(
            children: [
              Icon(
                icon,
                color: text == currentScreen ? Color(0xfff5a8a8) : Colors.grey,
              ),
              Text(
                '$text',
                style: TextStyle(
                    color:
                        text == currentScreen ? Color(0xfff5a8a8) : Colors.grey,
                    fontSize: 10.0),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              screenId,
              arguments: ScreenArguments('$text'),
            );
          },
        ),
      ),
    );
  }
}
