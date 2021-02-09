import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

// https://mightytechno.com/flutter-textfield/

class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final customColors = CustomColors();
  TextEditingController controllerEmail;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
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
      child: TextFormField(
        controller: controllerEmail,
        inputFormatters: [
          LengthLimitingTextInputFormatter(30),
        ],
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: customColors.navigationBarSelectedItemColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          hintStyle: TextStyle(),
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }
}
