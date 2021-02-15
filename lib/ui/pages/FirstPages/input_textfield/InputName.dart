import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class InputName extends StatefulWidget {
  @override
  _InputNameState createState() => _InputNameState();
}

final customColors = CustomColors();

class _InputNameState extends State<InputName> {
  TextEditingController controllerName;

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.75.h, right: 0.3.h, left: 0.3.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.5),
          boxShadow: [
            BoxShadow(
              color: Colors.white38,
              blurRadius: 0.05.w,
              spreadRadius: 0,
              offset: Offset(0.45.w, 0.9.w),
            ),
          ]),
      child: TextField(
        controller: controllerName,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: customColors.navigationBarSelectedItemColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Name',
          hintStyle: TextStyle(),
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}
