import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/login_page.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/email_verificationAlternative.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/registration_succesful.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;
  TextEditingController controllerRepeatedPassword;
  bool _passwordVisible;
  bool _passwordVisibleRepeatedPassword;
  bool _checkBoxValue;

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisibleRepeatedPassword = false;
    _checkBoxValue = false;
    super.initState();
    //_controllerName = TextEditingController();
    //_controllerEmail = TextEditingController();
    //_controllerPassword = TextEditingController();
    //_controllerRepeatedPassword = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerName = TextEditingController();
    controllerRepeatedPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _gestureRecognizerSignIn = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: LoginPage(),
              inheritTheme: true,
              ctx: context),
        );
      };
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
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
                    Navigator.of(context).popUntil((route) => route.isFirst);
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
                                'Sign Up',
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
                            Padding(
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
                                      height: 33.0.h,
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
                                                controller: controllerName,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 12.5.sp,
                                                  color: Colors.white60,
                                                ),
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                cursorColor: customColors
                                                    .navigationBarSelectedItemColor,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Your Name',
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
                                                keyboardType:
                                                    TextInputType.emailAddress,
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
                                                controller: controllerPassword,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 12.5.sp,
                                                  color: Colors.white60,
                                                ),
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                cursorColor: customColors
                                                    .navigationBarSelectedItemColor,
                                                obscureText: !_passwordVisible,
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.95.h, left: 3.75.w),
                                            child: Container(
                                              child: TextFormField(
                                                controller:
                                                    controllerRepeatedPassword,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 12.5.sp,
                                                  color: Colors.white60,
                                                ),
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                cursorColor: customColors
                                                    .navigationBarSelectedItemColor,
                                                obscureText: !_passwordVisible,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Confirm Password',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 0.65.h, left: 3.85.w, right: 7.5.w),
                                  child: Row(
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
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _checkBoxValue =
                                                    !_checkBoxValue;
                                              });
                                            },
                                            child: Text(
                                              'Agree to ',
                                              style: TextStyle(
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: "Terms & Conditions",
                                              style: TextStyle(
                                                  color: customColors
                                                      .navigationBarSelectedItemColor),
                                              recognizer:
                                                  _gestureRecognizerSignIn,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 9.5.h),
                            Container(
                              height: 7.0.h,
                              width: 57.5.w,
                              decoration: BoxDecoration(
                                  color: customColors.backgroundColor,
                                  border: Border.all(
                                      color: customColors.headlineBoxColor,
                                      width: 0.75.w),
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
                                  bool shouldNavigate = await register(
                                    controllerName.text,
                                    controllerEmail.text,
                                    controllerPassword.text,
                                  );
                                  if (shouldNavigate) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpSuccessful()));
                                  } else {}
                                },
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
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
                                    text: "Already having an account?  ",
                                    style: TextStyle(color: Colors.white38)),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: customColors
                                          .navigationBarSelectedItemColor),
                                  recognizer: _gestureRecognizerSignIn,
                                ),
                              ]),
                            ),
                            SizedBox(height: 2.5.h),
                          ],
                        ),
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
