import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:informatik_projekt/ui/pages/MainPages/Account/account_changePassword.dart';
import 'package:informatik_projekt/ui/pages/MainPages/Account/account_editProfile.dart';
import 'package:informatik_projekt/ui/shared_widgets/popUp.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/FirstPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  bool _switchValue = false;
  bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundColor,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.5.h, left: 8.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.5.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 4.45.w),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final action =
                                          await Dialogs.yesAbortDialog(
                                        context,
                                        'Login Out',
                                        'Are you sure you want to log out?',
                                        'Log Out',
                                        'Cancel',
                                        1,
                                        FirstPage(),
                                      );
                                    },
                                    child: Icon(
                                      Icons.exit_to_app,
                                      color: customColors
                                          .navigationBarUnselectedItemColor,
                                      size: 6.25.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.5.h, left: 8.0.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      customColors.headlineBoxColor,
                                  radius: 8.75.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7.5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontSize: 18.5.sp,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      SizedBox(height: 0.125.h),
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 11.0.sp,
                                          color: Colors.white24,
                                        ),
                                      ),
                                      SizedBox(height: 2.575.h),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: AccountEditProfile(),
                                                inheritTheme: true,
                                                ctx: context),
                                          );
                                        },
                                        child: Container(
                                          height: 2.95.h,
                                          width: 13.25.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22.5),
                                            border: Border.all(
                                              color: customColors
                                                  .navigationBarSelectedItemColor,
                                              width: 0.375.w,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                color: customColors
                                                    .navigationBarSelectedItemColor,
                                                fontSize: 9.0.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.45.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 6.45.w),
                                  child: Text(
                                    'Account',
                                    style: TextStyle(
                                      fontSize: 13.75.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.25.h, left: 3.65.w, right: 3.65.w),
                                  child: Container(
                                    height: 8.25.h,
                                    width: 100.0.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.5),
                                      color: customColors.headlineBoxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2.5.h,
                                              left: 3.75.w,
                                              bottom: 1.5.h),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child:
                                                        AccountChangePassword(),
                                                    inheritTheme: true,
                                                    ctx: context),
                                              );
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: customColors
                                                        .navigationBarSelectedItemColor,
                                                    size: 5.0.w,
                                                  ),
                                                  SizedBox(width: 3.0.w),
                                                  Text(
                                                    'Change Password',
                                                    style: TextStyle(
                                                      fontSize: 14.0.sp,
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                                ],
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
                          Padding(
                            padding: EdgeInsets.only(top: 4.45.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 6.45.w),
                                  child: Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 13.75.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.25.h, left: 3.65.w, right: 3.65.w),
                                  child: Container(
                                    height: 8.25.h,
                                    width: 100.0.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.5),
                                      color: customColors.headlineBoxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2.5.h,
                                              left: 3.75.w,
                                              right: 3.75.w,
                                              bottom: 1.5.h),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'App Notifications',
                                                    style: TextStyle(
                                                      fontSize: 14.0.sp,
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                                  AdvancedSwitch(
                                                    width: 36,
                                                    height: 18,
                                                    value: _switchValue,
                                                    onChanged: (value) =>
                                                        setState(() {
                                                      _switchValue = value;
                                                    }),
                                                    activeColor: customColors
                                                        .navigationBarSelectedItemColor,
                                                    inactiveColor: customColors
                                                        .navigationBarUnselectedItemColor,
                                                  ),
                                                ],
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
                          Padding(
                            padding: EdgeInsets.only(top: 4.45.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 6.45.w),
                                  child: Text(
                                    'Others',
                                    style: TextStyle(
                                      fontSize: 13.75.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.25.h, left: 3.65.w, right: 3.65.w),
                                  child: Container(
                                    height: 14.0.h,
                                    width: 100.0.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.5),
                                      color: customColors.headlineBoxColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2.5.h,
                                              left: 3.75.w,
                                              bottom: 1.5.h),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Language',
                                                    style: TextStyle(
                                                      fontSize: 14.0.sp,
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                                ],
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
                                              top: 1.5.h,
                                              left: 3.75.w,
                                              bottom: 1.5.h),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Currency',
                                                    style: TextStyle(
                                                      fontSize: 14.0.sp,
                                                      color: Colors.white38,
                                                    ),
                                                  ),
                                                ],
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
                          SizedBox(height: 4.25.h),
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
    );
  }
}
