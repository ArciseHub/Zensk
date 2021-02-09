import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class ChartSelectedTime extends StatefulWidget {
  ChartSelectedTime({@required this.timeOrName});

  final String timeOrName;

  @override
  _ChartSelectedTimeState createState() => _ChartSelectedTimeState();
}

class _ChartSelectedTimeState extends State<ChartSelectedTime> {
  bool enabled = false;

  final customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              color: customColors.mainBoxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                widget.timeOrName,
                style: TextStyle(
                  color: (enabled
                      ? customColors.navigationBarSelectedItemColor
                      : Colors.white30),
                  fontSize: 15,
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              if (enabled == false) {
                enabled = true;
              } else {
                enabled = false;
              }
            });
          },
        ),
      ],
    );
  }
}
