import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/shared_widgets/navigation_bar/navigation_bar.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class SignUpSuccessful extends StatefulWidget {
  @override
  _SignUpSuccessfulState createState() => _SignUpSuccessfulState();
}

class _SignUpSuccessfulState extends State<SignUpSuccessful>
    with SingleTickerProviderStateMixin {
  final customColors = CustomColors();
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewNewNavigationBar()));
    });
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2, milliseconds: 0));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 22.5.h),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/green_tick.png",
                  height: 20.0.h, //40%
                ),
              ),
              SizedBox(height: 8.0.h),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 25.0.h),
                child: Text(
                  "Sign up was successful",
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
