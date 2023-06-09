import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Wheat extends StatelessWidget {
  const Wheat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Lottie.asset('assets/water_plant.json', height: 270, width: 270),
          Text(
            "Not yet planted",
            style: TextStyle(
                fontSize: 27, color: Color.fromARGB(255, 106, 106, 106)),
          )
        ],
      ),
    );
  }
}
