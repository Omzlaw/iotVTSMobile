import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotvts/models_and_widgets/card_indicator_model.dart';
import 'package:iotvts/models_and_widgets/bottom_layout.dart';

class Cards extends StatelessWidget {
  final DataSnapshot snapshot;
  final String currentScreen;
  Cards(this.snapshot, this.currentScreen);

  @override
  Widget build(BuildContext context) {
    if (currentScreen == 'stats') {
      return buildColumn();
    }
    if (currentScreen == snapshot.key) {
      return buildColumn();
    } else {
      return Container();
    }
  }

  Column buildColumn() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                height: currentScreen == 'stats' ? 200 : 248,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      returnIcon(snapshot.key.toString()),
                      color: Color(0xffe19999),
                      size: 100.0,
                    ),
                    Text(
                      '${snapshot.key.toString()}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff7d5a5a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: currentScreen == 'stats' ? 200 : 248,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Icon(
                          returnIndication('${snapshot.key.toString()}',
                              '${snapshot.value}'),
                          size: 50,
                          color: returnIndication('${snapshot.key.toString()}',
                                      '${snapshot.value}') ==
                                  FontAwesomeIcons.solidAngry
                              ? Color(0xffeb6383)
                              : Color(0xffb4f2e1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${snapshot.value}',
                            style: TextStyle(
                                color: Color(0xff7d5a5a), fontSize: 30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        currentScreen != 'stats'
            ? Row(
                children: [
                  BottomLayout(currentScreen, ''),
                ],
              )
            : Container(),
      ],
    );
  }
}
