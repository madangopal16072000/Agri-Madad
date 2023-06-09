import 'package:cloud_firestore/cloud_firestore.dart';

class CropTask {
  double waterneed;
  String uid;
  String time;
  CropTask({
    required this.waterneed,
    required this.uid,
    required this.time,
  });

  Map<String, dynamic> toJson() =>
      {"waterneed": waterneed, "uid": uid, "time": time};

  static CropTask fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CropTask(
      waterneed: snapshot['waterneed'],
      uid: snapshot['uid'],
      time: snapshot['time'],
    );
  }
}
