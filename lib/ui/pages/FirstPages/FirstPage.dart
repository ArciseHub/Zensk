import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/login_page.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/register_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:page_transition/page_transition.dart';

class FirstPage extends StatelessWidget {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(2.25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 55.0.h, //with Text underneath 45.0.h
                width: double.infinity,
                child: Image.asset('assets/images/app_logo_transparent.png'),
              ),
              SizedBox(height: 2.25.h),
              Text(
                //"Name of the App \nor what is does",
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.25.h),
              Text(
                //"The text here should maybe about what this app can do and how it can benefit the users. "
                //"The text here should maybe about what this app can do and how it can benefit the users.",
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12.35.sp,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: Container(
                  height: 7.0.h,
                  width: 68.75.w,
                  decoration: BoxDecoration(
                      color: customColors.headlineBoxColor,
                      borderRadius: BorderRadius.circular(22.5),
                      boxShadow: [
                        BoxShadow(
                          color: customColors.shadowColor,
                          blurRadius: 0.05.w,
                          spreadRadius: 0,
                          offset: Offset(0.5625.w, 1.125.w),
                        ),
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: LoginPage(),
                            inheritTheme: true,
                            ctx: context),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.h),
                child: Container(
                  height: 7.0.h,
                  width: 68.75.w,
                  decoration: BoxDecoration(
                      color: customColors.backgroundColor,
                      border: Border.all(
                          color: customColors.headlineBoxColor, width: 0.75.w),
                      borderRadius: BorderRadius.circular(22.5),
                      boxShadow: [
                        BoxShadow(
                          color: customColors.shadowColor,
                          blurRadius: 0.05.w,
                          spreadRadius: 0,
                          offset: Offset(0.5625.w, 1.125.w),
                        ),
                      ]),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: RegisterPage(),
                            inheritTheme: true,
                            ctx: context),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),
            ],
          ),
        ),
      ),
    );
  }
}
