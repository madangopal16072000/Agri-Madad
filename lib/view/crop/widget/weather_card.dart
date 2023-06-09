import 'dart:ffi';

import 'package:agri_app/constants.dart';
import 'package:agri_app/model/weather.dart';
import 'package:agri_app/controller/weather%20services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  // getweatherinfo() async {
  //   var positon = await getposition();
  //   var data = await getweatherdata(positon.latitude, positon.longitude);
  //   return data;
  // }

  Widget build(BuildContext context) {
    var data = Data;
    return (data.value.icon == "")
        ? CircularProgressIndicator(
            color: Colors.lightBlueAccent,
          )
        : Obx(() {
            return Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 9),
              // margin: EdgeInsets.only(right: 9, left: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network("https:${data.value.icon}",
                        width: MediaQuery.of(context).size.width * 0.36,
                        fit: BoxFit.fill),
                    Text(
                      "${data.value.condition}",
                      style: TextStyle(fontSize: 27),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/windspeed.png',
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                "${data.value.windspeed}",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "WindSpeed",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/humidity.png',
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                "${data.value.humidity}",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "humidity",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Image.asset(
                                  'assets/temp.png',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              Text(
                                "${data.value.temp}°C",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Temp",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
  }
}
