import 'package:agri_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCardtab extends StatefulWidget {
  String txt;

  CustomCardtab({super.key, required this.txt});

  @override
  State<CustomCardtab> createState() => _CustomCardtabState();
}

class _CustomCardtabState extends State<CustomCardtab> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.9,
      borderRadius: BorderRadius.all(Radius.circular(36)),
      color: Color.fromARGB(248, 240, 255, 255),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          //  width: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.6, 0.9],
              colors: [
                Color.fromARGB(255, 255, 222, 123),
                Color.fromARGB(255, 255, 231, 158)

                // Color.fromARGB(255, 99, 181, 248),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 9,
              ),
              Text(
                widget.txt,
              ),
              SizedBox(
                width: 9,
              ),
              (widget.txt == "Overview")
                  ? Icon(Icons.ac_unit_rounded)
                  : Icon(Icons.water_drop_rounded),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
