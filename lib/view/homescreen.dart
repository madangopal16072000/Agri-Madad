// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agri_app/view/crop/Screen/wheat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/view/Overview/Screen/Overview_screen.dart';
import 'package:agri_app/view/crop/Screen/CropScreen.dart';
import 'package:agri_app/view/widgets/Curent_task.dart';
import 'package:agri_app/view/widgets/custom_cardtab.dart';
import 'package:agri_app/view/widgets/lowertabBar.dart';

class HomeScreen extends StatelessWidget {
  ZoomDrawerController zoomcontroller;
  @override
  HomeScreen({
    Key? key,
    required this.zoomcontroller,
  }) : super(key: key);
  // void initState() {

  //   // TODO: implement initState
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: [SystemUiOverlay.bottom]);
  //   super.initState();
  // }

  final homecontroller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    //
    List<String> crops = ["Overview", "Potato", "Wheat"];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: LowerTabBar(
            zoomcontroller: zoomcontroller,
          )),
      //backgroundColor:   Color.fromARGB(255, 242, 255, 242),,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 42,
            ),
            Container(
              child: TabBar(
                // controller: tabController,

                isScrollable: true,
                labelColor: Colors.lightBlueAccent,

                unselectedLabelColor: Color.fromARGB(255, 139, 139, 139),
                indicatorColor: Colors.transparent,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(
                    child: CustomCardtab(
                      txt: "Overview",
                    ),
                  ),
                  Tab(
                    child: CustomCardtab(
                      txt: "Potato",
                    ),
                  ),
                  Tab(
                    child: CustomCardtab(
                      txt: "Wheat",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                children: [
                  // TabComponent(data: data_UG),
                  // TabComponent(data: data_PG),
                  // TabComponent(data: data_PHD)
                  OverviewScreen(),
                  CropScreen(),
                  Wheat()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
