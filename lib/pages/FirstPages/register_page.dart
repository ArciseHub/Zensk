import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:informatik_projekt/pages/FirstPages/email_verification.dart';
import 'package:informatik_projekt/pages/FirstPages/login_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/controllerClass.dart';
import 'email_verificationAlternative.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final customColors = CustomColors();
  final controller = ControllerClass();
  final _scrollController = ScrollController();
  //TextEditingController _controllerName;
  //TextEditingController _controllerEmail;
  //TextEditingController _controllerPassword;
  //TextEditingController _controllerRepeatedPassword;
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
    controller.email = TextEditingController();
    controller.password = TextEditingController();
    controller.name = TextEditingController();
    controller.repeatedPassword = TextEditingController();
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
                                'Sign Up',
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
                            //name
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5.0.h, left: 7.5.w, right: 7.5.w),
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
                                controller: controller.name,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    customColors.navigationBarSelectedItemColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  hintStyle: TextStyle(),
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                            //email
                            Container(
                              margin: EdgeInsets.only(
                                  top: 2.0.h, left: 7.5.w, right: 7.5.w),
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
                                controller: controller.email,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    customColors.navigationBarSelectedItemColor,
                                decoration: InputDecoration(
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
                                controller: controller.password,
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
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
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
                            ),
                            //repeated password
                            Container(
                              margin: EdgeInsets.only(
                                  top: 2.0.h, left: 7.5.w, right: 7.5.w),
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
                                controller: controller.repeatedPassword,
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.2.h, left: 7.5.w, right: 7.5.w),
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
                                                  color: Colors.white),
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
                                    controller.name.text,
                                    controller.email.text,
                                    controller.password.text,
                                  );
                                  if (shouldNavigate) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmailVerificationAlternative()));
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
                            SizedBox(height: 12.5.h),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Already having an account?  ",
                                    style: TextStyle(color: Colors.white38)),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.white),
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
