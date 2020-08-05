import 'package:firebase_database/firebase_database.dart';

class FirebaseOp {
  DatabaseReference ref;
  DatabaseReference refImage =
      FirebaseDatabase.instance.reference().child('omeizaalabi@gmail');
  String base64String = "";

  setRef() {
    ref = FirebaseDatabase.instance
        .reference()
        .child('omeizaalabi@gmail')
        .child('vehicleConditions');
    ref.keepSynced(true);
  }

  refData() {
    return ref;
  }

  updateData(String key, String value) {
    ref = FirebaseDatabase.instance
        .reference()
        .child('omeizaalabi@gmail')
        .child('vehicleConditions');
    ref.update({'$key': '$value'});
  }

  captureImage() {
    refImage.update({'Capture_image': 'Yes'});
  }
}
