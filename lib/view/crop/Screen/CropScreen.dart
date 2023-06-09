import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/controller/predictcontroller.dart';
import 'package:agri_app/view/crop/widget/weather_card.dart';
import 'package:agri_app/view/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CropScreen extends StatelessWidget {
  final name;

  CropScreen({super.key, this.name});
  final predictcontroller = Get.put(PredictController());
  final homecontroller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            WeatherCard(),
            // Icon(
            //   Icons.gas_meter,
            //   size: 45,
            // ),
            SizedBox(
              height: 36,
            ),
            Divider(
              thickness: 0.5,
              color: buttonColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "Water Requirement",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationThickness: 1,
                    fontSize: 27,
                    color: Colors.lightBlueAccent),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              splashColor: Color.fromARGB(255, 178, 180, 178),
              onTap: () async {
                DatabaseReference starCountRef2 =
                    FirebaseDatabase.instance.ref();

                starCountRef2.update({'Irrigate': 0});
                var uid = firebaseAuth.currentUser!.uid;

                // await firestore.collection('croptask').doc(uid).delete();
                await firestore
                    .collection('croptask')
                    .doc('uid')
                    .get()
                    .then((docSnapshot) {
                  if (docSnapshot.exists) {
                    docSnapshot.reference.delete().then((_) {
                      print("Document deleted successfully.");
                    }).catchError((error) {
                      print("Error deleting document: $error");
                    });
                  }
                });

                CollectionReference collectionRef = firestore
                    .collection('croptask')
                    .doc(uid)
                    .collection('currentask');

                QuerySnapshot querySnapshot = await collectionRef.get();
                querySnapshot.docs.forEach((document) {
                  document.reference.delete();
                });

                homecontroller.fetchtaskdata();
              },
              child: Container(
                  height: 270,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 5,
                        axisLineStyle: AxisLineStyle(thickness: 3),
                        showTicks: false,
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              value: waterneed.value,
                              enableAnimation: true,
                              animationDuration: 5400,
                              needleStartWidth: 0,
                              needleEndWidth: 5,
                              needleColor: Color(0xFFDADADA),
                              knobStyle: KnobStyle(
                                  color: Colors.white,
                                  borderColor: Color(0xFFDADADA),
                                  knobRadius: 0.01,
                                  borderWidth: 0.04),
                              tailStyle: TailStyle(
                                  color: Color(0xFFDADADA),
                                  width: 5,
                                  length: 0.15)),
                          RangePointer(
                              value: waterneed.value,
                              width: 3,
                              animationDuration: 5400,
                              enableAnimation: true,
                              color: Color.fromARGB(255, 88, 250, 250))
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            angle: 90,
                            positionFactor: 0.4,
                            widget: Text(
                              '${waterneed.value}cm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),

            // CustomButton(
            //   title: 'irrigate',
            //   ontap:
            // )
          ],
        ),
      );
    });
  }
}
