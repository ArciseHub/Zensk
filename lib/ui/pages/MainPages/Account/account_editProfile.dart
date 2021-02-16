import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/shared_widgets/popUp.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/FirstPage.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class AccountEditProfile extends StatefulWidget {
  @override
  _AccountEditProfileState createState() => _AccountEditProfileState();
}

class _AccountEditProfileState extends State<AccountEditProfile> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  bool tappedYesOut = false;
  bool tappedYes = false;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: customColors.navigationBarUnselectedItemColor,
              size: 9.25.w,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 4.45.w),
              child: GestureDetector(
                onTap: () async {
                  final action = await Dialogs.yesAbortDialog(
                    context,
                    'Login Out',
                    'Are you sure you want to log out?',
                    'Log Out',
                    'Cancel',
                    1,
                    FirstPage(),
                  );
                  if (action == DialogAction.yes) {
                    setState(() => tappedYesOut = true);
                  } else {
                    setState(() => tappedYesOut = false);
                  }
                },
                child: Icon(
                  Icons.exit_to_app,
                  color: customColors.navigationBarUnselectedItemColor,
                  size: 6.25.w,
                ),
              ),
            ),
          ],
        ),
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
                              padding: EdgeInsets.only(left: 8.0.w),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.5.sp,
                                  color: Colors.white70,
                                ),
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
                                        Icon(
                                          Icons.open_in_browser,
                                          size: 5.75.w,
                                          color: customColors
                                              .navigationBarUnselectedItemColor,
                                        ),
                                        SizedBox(height: 2.575.h),
                                        Icon(
                                          Icons.clear,
                                          size: 5.75.w,
                                          color: customColors
                                              .navigationBarSelectedItemColor,
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
                                        top: 1.25.h,
                                        left: 3.65.w,
                                        right: 3.65.w,
                                        bottom: 0.75.h),
                                    child: Container(
                                      height: 17.75.h,
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
                                              top: 1.95.h,
                                              left: 3.75.w,
                                            ),
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
                                                  hintText: 'Name',
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
                                              top: 1.95.h,
                                              left: 3.75.w,
                                            ),
                                            child: Container(
                                              child: TextFormField(
                                                controller: controllerEmail,
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
                                                  hintText: 'Email',
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.25.h,
                                        left: 3.65.w,
                                        right: 3.65.w),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final action =
                                            await Dialogs.yesAbortDialog(
                                          context,
                                          'Delete Account',
                                          'Are you sure you want to delete your account?',
                                          'Delete Account',
                                          'Cancel',
                                          2,
                                          FirstPage(),
                                        );
                                        if (action == DialogAction.yes) {
                                          setState(() => tappedYes = true);
                                        } else {
                                          setState(() => tappedYes = false);
                                        }
                                      },
                                      child: Container(
                                        height: 8.25.h,
                                        width: 100.0.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.5),
                                          color: customColors.headlineBoxColor,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 3.25.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.clear,
                                                size: 5.75.w,
                                                color: Colors.red,
                                              ),
                                              SizedBox(width: 2.5.w),
                                              Text(
                                                'Delete Account',
                                                style: TextStyle(
                                                  fontSize: 15.0.sp,
                                                  color: Colors.white38,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 3.25.h,
                                        left: 3.65.w,
                                        right: 3.65.w),
                                    child: Container(
                                      height: 6.5.h,
                                      width: 100.0.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: customColors
                                              .navigationBarSelectedItemColor,
                                          width: 0.175.h,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Update Profile',
                                          style: TextStyle(
                                            fontSize: 14.5.sp,
                                            color: customColors
                                                .navigationBarSelectedItemColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.25.h),
                                ],
                              ),
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
