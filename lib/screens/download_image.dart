import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotvts/models_and_widgets/app_bar.dart';
import 'package:iotvts/models_and_widgets/bottom_layout.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:iotvts/services/firebase_CRUD.dart';
import 'dart:async';

class DownloadImage extends StatefulWidget {
  static String id = 'dm';

  @override
  _DownloadImageState createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  String status;
  var imageURL;
  StreamSubscription<Event> refSub;
  FirebaseOp firebaseOp = FirebaseOp();
  DatabaseReference refImage =
      FirebaseDatabase.instance.reference().child('omeizaalabi@gmail');

  @override
  void initState() {
    super.initState();
    initialGet();
    refSub = refImage.onChildChanged.listen((Event event) {
      changeURL(event);
    });
  }

  initialGet() {
    refImage.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        if (k == 'ImageURL') {
          print(v);
          setState(() {
            imageURL = v;
          });
        }
      });
    });
  }

  changeURL(Event event) {
    if (event.snapshot.key == 'ImageURL') {
      setState(() {
        imageURL = event.snapshot.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Image', FontAwesomeIcons.image),
      bottomNavigationBar: buildBottomAppBar('Image'),
      body: imageURL == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffeb6383),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 6.0),
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
                        child: Image(image: NetworkImage('$imageURL')),
                      ),
                    ),
                    BottomLayout('Image', imageURL)
                  ],
                ),
              ),
//          BottomLayout('Image'),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    refSub.cancel();
  }
}
