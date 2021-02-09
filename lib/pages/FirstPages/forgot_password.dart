import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/main.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/pages/FirstPages/login_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:informatik_projekt/controllerClass.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  //TextEditingController _controllerEmail;
  final controller = ControllerClass();

  @override
  void initState() {
    super.initState();
    //_controllerEmail = TextEditingController();
    controller.email = TextEditingController();
  }

  Future _showEmailSendNotification() async {
    var androidDetails = AndroidNotificationDetails(
      "channelId",
      "Local Notification",
      "This is the description of the Notification, you can write anything.",
      importance: Importance.high,
    );
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    await flutterLocalNotificationsPlugin.show(0, "Reset Password",
        "A link has been sent to your email", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    final _gestureRecognizerForgotPassword = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
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
              children: [
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
                                'Password',
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
                          children: [
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
                          ],
                        ),
                        SizedBox(height: 12.75.h),
                        Padding(
                          padding: EdgeInsets.only(left: 21.5.w, right: 21.5.w),
                          child: Container(
                            height: 7.0.h,
                            width: 57.5.w,
                            decoration: BoxDecoration(
                                color: customColors.headlineBoxColor,
                                border: Border.all(
                                    color: customColors.mainBoxColor,
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
                                bool shouldNavigate =
                                    await forgotPassword(controller.email.text);
                                if (shouldNavigate) {
                                  _showEmailSendNotification();
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: LoginPage(),
                                        inheritTheme: true,
                                        ctx: context),
                                  );
                                } else {}
                              },
                              child: Center(
                                child: Text(
                                  'Reset',
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
                        SizedBox(height: 12.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Remembered your password?  ",
                                    style: TextStyle(color: Colors.white38)),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.white),
                                  recognizer: _gestureRecognizerForgotPassword,
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
