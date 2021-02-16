import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/forgot_password.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/login_succesful.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/register_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

//https://www.youtube.com/watch?v=0ENSb1dx4Ds

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;
  bool _passwordVisible;
  bool _checkBoxValue;

  @override
  void initState() {
    _passwordVisible = false;
    _checkBoxValue = false;
    super.initState();
    //_controllerEmail = TextEditingController();
    //_controllerPassword = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _gestureRecognizerSignUp = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: RegisterPage(),
              inheritTheme: true,
              ctx: context),
        );
      };
    final _gestureRecognizerForgotPassword = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop,
              child: ForgotPassword(),
              inheritTheme: true,
              ctx: context),
        );
      };
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: customColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: customColors.backgroundColor,
          elevation: 0.0,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.5.h, left: 5.5.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: customColors.navigationBarUnselectedItemColor,
                    size: 4.5.h,
                  ),
                ),
              ),
            ],
          ),
          leadingWidth: 50.0.w,
          toolbarHeight: 10.0.h,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FadingEdgeScrollView.fromScrollView(
                    child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0.h, left: 7.5.w, right: 7.5.w),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 32.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Form(
                              // ignore: deprecated_member_use
                              autovalidate: true,
                              key: formKey,
                              child: Padding(
                                padding: EdgeInsets.only(top: 4.05.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.25.h,
                                          left: 3.65.w,
                                          right: 3.65.w,
                                          bottom: 0.75.h),
                                      child: Container(
                                        height: 17.55.h,
                                        width: 100.0.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.5),
                                          color: customColors.headlineBoxColor,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 1.95.h, left: 3.75.w),
                                              child: Container(
                                                child: TextFormField(
                                                  controller: controllerEmail,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  style: TextStyle(
                                                    fontSize: 12.5.sp,
                                                    color: Colors.white60,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  cursorColor: customColors
                                                      .navigationBarSelectedItemColor,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.green,
                                                    border: InputBorder.none,
                                                    hintText: 'Your Email',
                                                    hintStyle: TextStyle(
                                                        fontSize: 12.5.sp,
                                                        color: Colors.white38),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 7.5.w, right: 7.5.w),
                                              color: Colors.white38,
                                              height: 0.025.h,
                                              width: 86.5.w,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 1.95.h, left: 3.75.w),
                                              child: Container(
                                                child: TextFormField(
                                                  controller:
                                                      controllerPassword,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 12.5.sp,
                                                    color: Colors.white60,
                                                  ),
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  cursorColor: customColors
                                                      .navigationBarSelectedItemColor,
                                                  obscureText:
                                                      !_passwordVisible,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Password',
                                                    hintStyle: TextStyle(
                                                        fontSize: 12.5.sp,
                                                        color: Colors.white38),
                                                    suffixIcon: IconButton(
                                                      splashRadius: 20,
                                                      icon: Icon(
                                                        _passwordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        color: _passwordVisible
                                                            ? Colors.white70
                                                            : Colors.white38,
                                                      ),
                                                      iconSize: 4.5.w,
                                                      onPressed: () {
                                                        setState(() {
                                                          _passwordVisible =
                                                              !_passwordVisible;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 7.5.w, right: 7.5.w),
                                              color: Colors.white38,
                                              height: 0.025.h,
                                              width: 86.5.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0.5.h, left: 7.5.w, right: 3.85.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 3.0.w),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Forgot Password?",
                                        style: TextStyle(
                                          color: customColors
                                              .navigationBarSelectedItemColor,
                                          fontSize: 15,
                                        ),
                                        recognizer:
                                            _gestureRecognizerForgotPassword,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.5.h),
                            Container(
                              height: 7.0.h,
                              width: 57.5.w, //before 80.0.h
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
                                onTap: () async {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setString(
                                      'email', controllerEmail.text);
                                  bool shouldNavigate = await logIn(
                                      controllerEmail.text,
                                      controllerPassword.text);
                                  if (shouldNavigate) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LogInSuccessful()));
                                  } else {}
                                },
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.15.h),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Don't have an account?  ",
                                    style: TextStyle(color: Colors.white38)),
                                TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(
                                      color: customColors
                                          .navigationBarSelectedItemColor),
                                  recognizer: _gestureRecognizerSignUp,
                                ),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
