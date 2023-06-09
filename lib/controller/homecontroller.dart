import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/weather%20services.dart';
import 'package:agri_app/model/User.dart';
import 'package:agri_app/model/notification.dart';
import 'package:agri_app/model/weather.dart';
import 'package:agri_app/view/crop/widget/notifiactionbadge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import '../model/currentask.dart' as model;

class HomeController extends GetxController {
  @override
  final Rx<List<model.CropTask>> _task = Rx<List<model.CropTask>>([]);
  List<model.CropTask> get task => _task.value;
  // var username = "".obs;
  var name = "".obs;
  // String get Username => username.value;
  void onInit() {
    // TODO: implement onInit
    // fetchusername();
    Get.snackbar("Irrigate", "Tap on meter to irrigate the field");
    getusername();
    getweatherinfo();
    //storedata();
    // ever(waterneed, storedata());

    super.onInit();
    // print("krishna");
  }

  void onReady() {
    // TODO: implement onReady
    fetchtaskdata();
    super.onReady();
  }

  getweatherinfo() async {
    var positon = await getposition();
    //   print(positon);
    var data = await getweatherdata(positon.latitude, positon.longitude)
        .then((value) => {Data = value.obs});

    // return data;
  }

  getusername() async {
    var uid = firebaseAuth.currentUser!.uid;
    var c = await firestore.collection('users').doc(uid).get();
    User us = User.fromSnap(c);
    username.value = us.name;
    //   print('${username}+username');
  }

  fetchtaskdata() async {
    List<model.CropTask> xx = [];
    var uid = firebaseAuth.currentUser!.uid;
    _task.bindStream(
      firestore
          .collection('croptask')
          .doc(uid)
          .collection('currentask')
          .snapshots()
          .map(
        (var query) {
          List<model.CropTask> retValue = [];
          for (var element in query.docs) {
            retValue.add(model.CropTask.fromSnap(element));
          }
          return retValue;
        },
      ),
    );
  }
}
