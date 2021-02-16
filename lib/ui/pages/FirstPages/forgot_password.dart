import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/main.dart';
import 'package:informatik_projekt/net/flutterfire.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/login_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  TextEditingController controllerEmail;

  @override
  void initState() {
    super.initState();
    //_controllerEmail = TextEditingController();
    controllerEmail = TextEditingController();
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
                                  top: 5.0.h, left: 7.5.w, right: 7.5.w),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 32.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  height: 9.75.h,
                                  width: 100.0.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.5),
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
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            cursorColor: customColors
                                                .navigationBarSelectedItemColor,
                                            decoration: InputDecoration(
                                              fillColor: Colors.green,
                                              border: InputBorder.none,
                                              hintText: 'Your Email or Phone',
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                    await forgotPassword(controllerEmail.text);
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
                        SizedBox(height: 6.15.h),
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
                                  style: TextStyle(
                                      color: customColors
                                          .navigationBarSelectedItemColor),
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
