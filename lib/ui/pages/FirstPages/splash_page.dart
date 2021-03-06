import 'dart:async';

import 'package:informatik_projekt/ui/pages/FirstPages/FirstPage.dart';
import 'package:informatik_projekt/ui/shared_widgets/navigation_bar/navigation_bar.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/onboarding_page.dart';
import 'package:flutter/material.dart';

String finalEmail;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
  static String route = "splash";
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final customColors = CustomColors();
  AnimationController _controller;
  Animation<double> _animation;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    bool _seen = (prefs.getBool('seen') ?? false);
    if ((_seen) && (finalEmail == null)) {
      Navigator.of(context).pushReplacement(
        new PageTransition(
            type: PageTransitionType.fade,
            child: FirstPage(),
            inheritTheme: true,
            ctx: context),
      );
    } else if (finalEmail != null) {
      Navigator.of(context).pushReplacement(
        new PageTransition(
            type: PageTransitionType.fade,
            child: NewNewNavigationBar(),
            inheritTheme: true,
            ctx: context),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        new PageTransition(
            type: PageTransitionType.fade,
            child: OnBoardingScreen(),
            inheritTheme: true,
            ctx: context),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      checkFirstSeen();
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
      //body: Container(
      //decoration: BoxDecoration(
      //gradient: LinearGradient(
      //  colors: [Colors.orange, Colors.deepOrange],
      //end: Alignment.bottomCenter,
      //begin: Alignment.topCenter),
      //),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Image.asset(
            "assets/images/app_logo_transparent.png",
            height: 45.0.h,
            width: 45.0.w,
          ),
        ),
      ),
    );
  }
}
