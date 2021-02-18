import 'dart:async';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/VerifyingLoader.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/login_page.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/register_page.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class EmailVerificationAlternative extends StatefulWidget {
  @override
  _EmailVerificationAlternativeState createState() =>
      _EmailVerificationAlternativeState();
}

class _EmailVerificationAlternativeState
    extends State<EmailVerificationAlternative>
    with SingleTickerProviderStateMixin {
  final customColors = CustomColors();
  final _scrollController = ScrollController();

  final FocusScopeNode _node = FocusScopeNode();

  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
        PageTransition(
            type: PageTransitionType.leftToRight,
            child: LoginPage(),
            inheritTheme: true,
            ctx: context),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    user = auth.currentUser;
    user.sendEmailVerification();
    checkEmailVerified();
    timer = Timer.periodic(Duration(seconds: 7, milliseconds: 500), (timer) {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: RegisterPage(),
                          inheritTheme: true,
                          ctx: context),
                    );
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
                                'Verifying',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.25.h),
                        Column(
                          children: [
                            Text(
                              'Verifying',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5.sp,
                              ),
                            ),
                            Text(
                              'EMAILNAME',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5.sp,
                              ),
                            ),
                            SizedBox(height: 12.5.w),
                            ColorLoader4(
                              dotOneColor: Colors.redAccent,
                              dotTwoColor: Colors.blueAccent,
                              dotThreeColor: Colors.green,
                              dotType: DotType.circle,
                              duration: Duration(seconds: 1),
                            ),
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
