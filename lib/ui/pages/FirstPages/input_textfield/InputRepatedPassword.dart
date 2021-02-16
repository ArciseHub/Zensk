import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class InputRepeatedPassword extends StatefulWidget {
  @override
  _InputRepeatedPasswordState createState() => _InputRepeatedPasswordState();
}

class _InputRepeatedPasswordState extends State<InputRepeatedPassword> {
  final customColors = CustomColors();
  bool _passwordVisibleRepeatedPassword;
  TextEditingController controllerRepeatedPassword;

  @override
  void initState() {
    _passwordVisibleRepeatedPassword = false;
    super.initState();
    controllerRepeatedPassword = TextEditingController();
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
        controller: controllerRepeatedPassword,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: customColors.headlineBoxColor,
        obscureText: !_passwordVisibleRepeatedPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Confirm password',
          hintStyle: TextStyle(),
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            splashRadius: 20,
            icon: Icon(
              _passwordVisibleRepeatedPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: customColors.headlineBoxColor,
            ),
            onPressed: () {
              setState(() {
                _passwordVisibleRepeatedPassword =
                    !_passwordVisibleRepeatedPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}
