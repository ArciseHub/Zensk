import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class PopUpSelecter extends StatefulWidget {
  PopUpSelecter({@required this.text});
  final String text;

  @override
  _PopUpSelecterState createState() => _PopUpSelecterState();
}

class _PopUpSelecterState extends State<PopUpSelecter> {
  final customColors = CustomColors();

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            color: (enabled
                ? customColors.navigationBarSelectedItemColor
                : customColors.headlineBoxColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: customColors.shadowColorLight,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(3, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (enabled ? Colors.white : Colors.white60),
                fontSize: 15.75,
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
    );
  }
}
