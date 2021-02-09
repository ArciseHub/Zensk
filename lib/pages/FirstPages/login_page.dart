import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:informatik_projekt/pages/FirstPages/forgot_password.dart';
import 'package:informatik_projekt/pages/FirstPages/login_succesful.dart';
import 'package:informatik_projekt/pages/FirstPages/register_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/controllerClass.dart';
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
  final controller = ControllerClass();
  //TextEditingController _controllerEmail;
  //TextEditingController _controllerPassword;
  bool _passwordVisible;
  bool _checkBoxValue;

  @override
  void initState() {
    _passwordVisible = false;
    _checkBoxValue = false;
    super.initState();
    //_controllerEmail = TextEditingController();
    //_controllerPassword = TextEditingController();
    controller.email = TextEditingController();
    controller.password = TextEditingController();
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 3.5.h,
                      ),
                      SizedBox(width: 1.0.w),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0.sp,
                        ),
                      )
                    ],
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
                                  top: 7.5.h, left: 7.5.w, right: 7.5.w),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
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
                              child: Column(
                                children: [
                                  //email
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 5.0.h, left: 7.5.w, right: 7.5.w),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(22.5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white38,
                                            blurRadius: 0.05.w,
                                            spreadRadius: 0,
                                            offset: Offset(0.45.w, 0.9.w),
                                          ),
                                        ]),
                                    child: TextFormField(
                                      controller: controller.email,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      cursorColor: customColors
                                          .navigationBarSelectedItemColor,
                                      decoration: InputDecoration(
                                        fillColor: Colors.green,
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        hintStyle: TextStyle(),
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ),
                                  //password
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 2.0.h, left: 7.5.w, right: 7.5.w),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(22.5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white38,
                                            blurRadius: 0.05.w,
                                            spreadRadius: 0,
                                            offset: Offset(0.45.w, 0.9.w),
                                          ),
                                        ]),
                                    child: TextFormField(
                                      controller: controller.password,
                                      textAlign: TextAlign.start,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      cursorColor:
                                          customColors.headlineBoxColor,
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: TextStyle(),
                                        prefixIcon: Icon(Icons.vpn_key),
                                        suffixIcon: IconButton(
                                          splashRadius: 20,
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color:
                                                customColors.headlineBoxColor,
                                          ),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0.5.h, left: 7.5.w, right: 7.5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checkBoxValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _checkBoxValue = value;
                                          });
                                        },
                                        activeColor:
                                            customColors.headlineBoxColor,
                                        checkColor: Colors.white,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _checkBoxValue = !_checkBoxValue;
                                          });
                                        },
                                        child: Text(
                                          'Remember me',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 3.0.w),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Forgot Password?",
                                        style: TextStyle(
                                          color: Colors.white38,
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
                                  bool shouldNavigate = await logIn(
                                      controller.email.text,
                                      controller.password.text);
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
                            SizedBox(height: 12.5.h),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Don't have an account?  ",
                                    style: TextStyle(color: Colors.white38)),
                                TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(color: Colors.white),
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
