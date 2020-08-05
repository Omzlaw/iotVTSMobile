import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:iotvts/services/firebase_CRUD.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:iotvts/models_and_widgets/card.dart';
import 'dart:async';

class MyLayout extends StatefulWidget {
  final String currentScreen;
  MyLayout(this.currentScreen);

  @override
  _MyLayoutState createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  bool _loaded = false;
  StreamSubscription<Event> refSub;
  FirebaseOp firebaseOp = FirebaseOp();

  @override
  void initState() {
    super.initState();
    firebaseOp.setRef();
    checkForData();
  }

  @override
  void dispose() {
    super.dispose();
    refSub.cancel();
  }

  void checkForData() {
    refSub = firebaseOp.refData().onChildAdded.listen((Event event) {
      if (event != null) {
        setState(() {
          _loaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentScreen = widget.currentScreen;
    return _loaded == false
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xffeb6383),
            ),
          )
        : Column(
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  query: firebaseOp.refData(),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: Cards(snapshot, currentScreen),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
