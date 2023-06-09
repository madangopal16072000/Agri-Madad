import 'package:agri_app/constants.dart';
import 'package:agri_app/controller/homecontroller.dart';
import 'package:agri_app/view/widgets/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var name = username;

    void initState() {}

    final homecontroller = Get.find<HomeController>();

    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [0.3, 0.9],
              colors: [
                Color.fromARGB(255, 227, 245, 252),
                Color.fromARGB(255, 191, 255, 193)
              ],
            )),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 300,
                  child: DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/profile.png',
                          height: 120,
                          width: 81,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9),
                          child: Row(
                            children: [
                              Text(
                                "Hi ,",
                                style: TextStyle(
                                    fontSize: 36,
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Lottie.asset('assets/hello.json', height: 45),
                            ],
                          ),
                        ),
                        Text(
                          "${username}",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Transform.translate(
                    offset: Offset(-27, 0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.settings),
                //   title: Transform.translate(
                //       offset: Offset(-27, 0),
                //       child: Text("Settings",
                //           style: TextStyle(
                //               //color: Colors.white,
                //               ))),
                // ),
                // ListTile(
                //   leading: Icon(Icons.help),
                //   title: Transform.translate(
                //       offset: Offset(-27, 0),
                //       child: Text("Help",
                //           style: TextStyle(
                //               //color: Colors.white,
                //               ))),
                // ),
                // ListTile(
                //   leading: Icon(Icons.phone),
                //   title: Transform.translate(
                //       offset: Offset(-27, 0),
                //       child: Text("Contact",
                //           style: TextStyle(
                //               //color: Colors.white,
                //               ))),
                // ),
                ListTile(
                  onTap: (() {
                    Get.to(AboutUs());
                  }),
                  leading: Icon(Icons.add_comment),
                  title: Transform.translate(
                      offset: Offset(-27, 0),
                      child: Text("About Us",
                          style: TextStyle(
                              //color: Colors.white,
                              ))),
                ),
                ListTile(
                    //tileColor: Colors.white,
                    // leading: Icon(Icons.exit_to_app),
                    //  title: Text("LogOut"),

                    title: Row(
                      children: [
                        Text(
                          "LogOut",
                          style: TextStyle(
                              color: Color.fromARGB(255, 244, 52, 38)),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Color.fromARGB(255, 244, 52, 38),
                        )
                      ],
                    ),
                    onTap: () => authController.signOut()),
                SizedBox(
                  height: 18.0,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
