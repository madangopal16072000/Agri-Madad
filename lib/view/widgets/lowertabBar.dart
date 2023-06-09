import 'package:agri_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';

class LowerTabBar extends StatelessWidget {
  // late BuildContext cntxt;
  final zoomcontroller;
  LowerTabBar({super.key, required this.zoomcontroller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 157, 248, 160),
              Color.fromARGB(255, 186, 230, 247)
            ],
            stops: [0.4, 1.3],
          ),
        ),
      ),
      leading: InkWell(
        onTap: () => ZoomDrawer.of(context)!.toggle(),
        child: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 38, 38, 38),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Agri Madad",
            style: TextStyle(
              color: Color.fromARGB(255, 38, 38, 38),
              fontSize: 30,
            ),
          ),
          Lottie.asset('assets/plant_walk.json', height: 108, width: 90),
        ],
      ),
    );
    // return Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         width: 6,
    //       ),
    //       InkWell(
    //         onTap: () => ZoomDrawer.of(context)!.toggle(),
    //         child: Icon(
    //           Icons.menu,
    //           color: Colors.lightBlueAccent,
    //         ),
    //       ),
    //       // Padding( zoomcontroller.toggle()
    //       //
    //       // padding: const EdgeInsets.only(left: 9.0),
    //       SizedBox(
    //         width: 12,
    //       ),
    //       Text(
    //         "Agri Madad",
    //         style: TextStyle(
    //           color: Colors.lightBlueAccent,
    //           fontSize: 30,
    //         ),
    //       ),
    //       SizedBox(
    //         width: 3,
    //       ),
    //       Lottie.asset('assets/water_plant.json', height: 81, width: 72),
    //       //  ),
    //     ],
    //   ),
    // );
  }
}
