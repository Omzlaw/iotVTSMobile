import 'package:flutter/material.dart';
import 'package:iotvts/services/firebase_CRUD.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' show get;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class BottomLayout extends StatefulWidget {
  final String currentScreen;
  final String url;
  BottomLayout(this.currentScreen, this.url);

  @override
  _BottomLayoutState createState() => _BottomLayoutState();
}

class _BottomLayoutState extends State<BottomLayout> {
  @override
  Widget build(BuildContext context) {
    FirebaseOp firebaseOp = FirebaseOp();
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RawMaterialButton(
              highlightColor: Colors.white,
              onPressed: () {
                if (widget.currentScreen == 'Engine' ||
                    widget.currentScreen == 'Door') {
                  firebaseOp.updateData(widget.currentScreen,
                      widget.currentScreen == 'Engine' ? 'On' : 'Closed');
                } else {
                  firebaseOp.captureImage();
                }
              },
              child: Container(
                child: Icon(
                  widget.currentScreen == 'Image'
                      ? FontAwesomeIcons.camera
                      : FontAwesomeIcons.toggleOn,
                  color: Colors.greenAccent,
                ),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffb4f2e1),
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
              ),
            ),
          ),
          Expanded(
            child: RawMaterialButton(
              highlightColor: Colors.white,
              onPressed: () {
                if (widget.currentScreen == 'Engine' ||
                    widget.currentScreen == 'Door') {
                  firebaseOp.updateData(widget.currentScreen,
                      widget.currentScreen == 'Engine' ? 'Off' : 'Open');
                }
                if (widget.currentScreen == 'Image') {
                  _downloadFile();
                }
              },
              child: Container(
                child: Icon(
                  widget.currentScreen == 'Image'
                      ? FontAwesomeIcons.fileDownload
                      : FontAwesomeIcons.toggleOff,
                  color: Colors.pink,
                ),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffeb6383),
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  _downloadFile() async {
    var response = await get('${widget.url}');
    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = documentDirectory.path + "/images";
    var filePathAndName = documentDirectory.path + '/images/vehicle.png';
    await Directory(firstPath).create(recursive: true); // <-- 1
    File file2 = new File(filePathAndName); // <-- 2
    file2.writeAsBytesSync(response.bodyBytes);
  }
}
