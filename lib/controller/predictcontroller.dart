import 'dart:convert';

import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/weather%20services.dart';
import 'package:agri_app/model/weather.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/currentask.dart' as model;

class PredictController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getfielddata();
    getdata();

    super.onInit();
    // print("krishna");
  }

  void onReady() {
    // TODO: implement onReady
    // ever(soiltemp, callback)
    super.onReady();
  }

  void getfielddata() async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child('Data');
    starCountRef.onValue.listen((DatabaseEvent event) async {
      var data =
          jsonDecode(event.snapshot.value! as String) as Map<String, dynamic>;
      //   data.runtimeType
      soiltemp = (data['temperature'] as int).obs;
      soilhumid = (data['humidity'] as int).obs;
      moisture = (data['moisture'] as int).obs;
      print('${soiltemp.value}');
      getdata();
      Future.delayed(Duration(seconds: 10));
    });
  }

  void getdata() async {
    String soiltype = "";
    if (moisture.value <= 300) {
      soiltype = "DRY";
    } else if (moisture.value >= 700) {
      soiltype = "WET";
    } else {
      soiltype = "HUMID";
    }
    String weatherconditon = "";
    if (Data.value.humidity <= 30) {
      weatherconditon = "SUNNY";
    } else if (Data.value.humidity > 40 && Data.value.humidity < 65) {
      weatherconditon = "NORMAL";
    } else {
      weatherconditon = "RAINY";
    }
    http.Response res = await http.post(
      Uri.parse('https://mlcropirrigation.azurewebsites.net/predict_api'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "data": {
          "CROP TYPE": "Wheat",
          "SOIL TYPE": soiltype,
          "WEATHER CONDITION": weatherconditon,
          "REGION": "SEMI HUMID",
          "TEMP MIN": Data.value.temp,
          "TEMP MAX": Data.value.temp,
        }
      }),
    );
    var l = double.parse((jsonDecode(res.body) as double).toStringAsFixed(2));

    waterneed = l.obs;
    storedata();
    // print('${l}+waterneed');
    update();
  }

  storedata() async {
    DateTime now = DateTime.now();
    var date =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    var uid = firebaseAuth.currentUser!.uid;
    model.CropTask tsk = model.CropTask(
      waterneed: waterneed.value as double,
      time: date,
      uid: uid,
    );

    var doc = await firestore
        .collection('croptask')
        .doc(uid)
        .collection('currentask')
        .doc('${waterneed}')
        .get();
    print(doc.exists);
    (doc.exists)
        ? await firestore
            .collection('croptask')
            .doc(uid)
            .collection('currentask')
            .doc('${waterneed}')
            .update(tsk.toJson())
        : await firestore
            .collection('croptask')
            .doc(uid)
            .collection('currentask')
            .doc('${waterneed}')
            .set(tsk.toJson());
  }
}
