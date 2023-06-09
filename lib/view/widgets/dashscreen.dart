import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/view/homescreen.dart';
import 'package:agri_app/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    final _drawerController = ZoomDrawerController();
    // Get.snackbar("Irrigate", "Tap on meter to irrigate the field");
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.Style1,
        menuScreen: DrawerScreen(),
        mainScreen: HomeScreen(
          zoomcontroller: _drawerController,
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * 0.45,
        //  (ZoomDrawer.isRTL() ? .45 : 0.65),
        //openCurve: Curves.fastOutSlowIn,
        // closeCurve: Curves.bounceIn,
      ),
    );
  }
}
