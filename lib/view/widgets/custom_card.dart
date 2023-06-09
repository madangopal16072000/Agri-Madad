import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomCard extends StatelessWidget {
  double water;
  String time;

  CustomCard({super.key, required this.time, required this.water});
  final homecontroller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.center,
            stops: [0.3, 0.9],
            colors: [
              color1,
              Color.fromRGBO(217, 252, 219, 1)

              // Color.fromARGB(255, 99, 181, 248),
            ],
          ),
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 9.0),
          leading: Lottie.asset('assets/overview2.json', height: 270),

          title: Text(
            "${water} L Water Required",
            style: TextStyle(
                color: Color.fromARGB(255, 71, 71, 71),
                fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Text(
            "At ${time}",
            style: TextStyle(
              color: Color.fromARGB(255, 72, 72, 72),
            ),
          ),
          trailing: InkWell(
            onTap: () async {},
            child: Image.asset(
              'assets/right.png',
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }
}
