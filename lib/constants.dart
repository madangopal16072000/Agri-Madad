import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/model/notification.dart';
import 'package:agri_app/model/weather.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/authcontroller.dart';

//firbase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var username = "".obs;
var moisture = 0.obs;
var soiltemp = 0.obs;
var soilhumid = 0.obs;
var Data = Weather(
        cityname: "",
        icon: "",
        temp: 0.0,
        humidity: 0,
        windspeed: 0.0,
        condition: "")
    .obs;
var waterneed = 0.0.obs;
Rx<PushNotification>? notificationInfo;
var tot_notification = 0.obs;
//controller
var authController = AuthController.instance;
var Username = "".obs;

//Color
const backgroundColor = Color.fromARGB(255, 237, 237, 237);
var color1 = Color.fromARGB(255, 157, 248, 160);
var color2 = Color.fromARGB(255, 146, 228, 247);
var color3 = Color.fromARGB(255, 186, 230, 247);
var color4 = Color.fromARGB(255, 165, 255, 168);
var color5 = Color.fromARGB(255, 93, 205, 97);
const borderColor = Colors.grey;
var buttonColor = color3; //Color.fromARGB(255, 61, 206, 250);
const String loginanimmationlink = "assets/login.riv";
var linergradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  stops: [0.3, 0.9],
  colors: [
    color1,
    buttonColor,

    // Color.fromARGB(255, 99, 181, 248),
  ],
);
