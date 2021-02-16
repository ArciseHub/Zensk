import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class InputPassword extends StatefulWidget {
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final customColors = CustomColors();
  bool _passwordVisible;
  TextEditingController controllerPassword;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    controllerPassword = TextEditingController();
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
        controller: controllerPassword,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: customColors.headlineBoxColor,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          hintStyle: TextStyle(),
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            splashRadius: 20,
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: customColors.headlineBoxColor,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
