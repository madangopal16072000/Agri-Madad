import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/model/currentask.dart';
import 'package:agri_app/view/crop/Screen/CropScreen.dart';
import 'package:agri_app/view/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CurrentTask extends StatelessWidget {
  const CurrentTask({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.find<HomeController>();

    return Obx(() {
      return Container(
        //  color: Color.fromARGB(255, 242, 255, 242),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset('assets/overview1.json', height: 270, width: 300),
              SizedBox(
                height: 18,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Material(
                  elevation: 27, //color: Color.fromARGB(255, 242, 255, 242),
                  // color: Colors.transparent,
                  //color: Color.fromARGB(255, 253, 226, 226),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Text(
                          "Current task",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dashed,
                              decorationThickness: 1,
                              fontSize: 27,
                              color: Colors.lightBlueAccent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          //W  color: Color.fromARGB(255, 223, 213, 179),
                          // color: Color.fromARGB(248, 16, 250, 16),
                          // decoration: BoxDecoration(shape: ),
                          height: 180,
                          width: 330,
                          //  color: Color.fromARGB(255, 254, 255, 255),

                          child: (homecontroller.task.length == 0)
                              ? Padding(
                                  padding: EdgeInsets.all(9),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Lottie.asset('assets/task.json',
                                          height: 118, width: 110),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 9.0),
                                        child: Text(
                                          "No task available",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 102, 102, 102)),
                                        ),
                                      ),
                                    ],
                                  ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: homecontroller.task.length,
                                  itemBuilder: ((context, index) {
                                    final task = homecontroller.task[index];
                                    return CustomCard(
                                      water: task.waterneed,
                                      time: task.time,
                                    );
                                  }),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
