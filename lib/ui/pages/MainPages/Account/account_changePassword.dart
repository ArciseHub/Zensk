import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class AccountChangePassword extends StatefulWidget {
  @override
  _AccountChangePasswordState createState() => _AccountChangePasswordState();
}

class _AccountChangePasswordState extends State<AccountChangePassword> {
  final customColors = CustomColors();
  final _scrollController = ScrollController();
  TextEditingController controllerOldPassword;
  TextEditingController controllerNewPassword;
  TextEditingController controllerConfirmPassword;
  bool _passwordVisible1;
  bool _passwordVisible2;
  bool _passwordVisible3;

  @override
  void initState() {
    _passwordVisible1 = false;
    _passwordVisible2 = false;
    _passwordVisible3 = false;
    super.initState();
    //_controllerEmail = TextEditingController();
    //_controllerPassword = TextEditingController();
    controllerOldPassword = TextEditingController();
    controllerNewPassword = TextEditingController();
    controllerConfirmPassword = TextEditingController();
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
                                'Change Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.5.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 2.95.h,
                                  left: 3.65.w,
                                  right: 3.65.w,
                                  bottom: 0.75.h),
                              child: Container(
                                height: 25.25.h,
                                width: 100.0.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.5),
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
                                          controller: controllerOldPassword,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: Colors.white60,
                                          ),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          cursorColor: customColors
                                              .navigationBarSelectedItemColor,
                                          obscureText: !_passwordVisible1,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Old Password',
                                            hintStyle: TextStyle(
                                                fontSize: 12.5.sp,
                                                color: Colors.white38),
                                            suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                _passwordVisible1
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: _passwordVisible1
                                                    ? Colors.white70
                                                    : Colors.white38,
                                              ),
                                              iconSize: 4.5.w,
                                              onPressed: () {
                                                setState(() {
                                                  _passwordVisible1 =
                                                      !_passwordVisible1;
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
                                        top: 1.95.h,
                                        left: 3.75.w,
                                      ),
                                      child: Container(
                                        child: TextFormField(
                                          controller: controllerNewPassword,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: Colors.white60,
                                          ),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          cursorColor: customColors
                                              .navigationBarSelectedItemColor,
                                          obscureText: !_passwordVisible2,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'New Password',
                                            hintStyle: TextStyle(
                                                fontSize: 12.5.sp,
                                                color: Colors.white38),
                                            suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                _passwordVisible2
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: _passwordVisible2
                                                    ? Colors.white70
                                                    : Colors.white38,
                                              ),
                                              iconSize: 4.5.w,
                                              onPressed: () {
                                                setState(() {
                                                  _passwordVisible2 =
                                                      !_passwordVisible2;
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
                                        top: 1.95.h,
                                        left: 3.75.w,
                                      ),
                                      child: Container(
                                        child: TextFormField(
                                          controller: controllerConfirmPassword,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: Colors.white60,
                                          ),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          cursorColor: customColors
                                              .navigationBarSelectedItemColor,
                                          obscureText: !_passwordVisible3,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Confirm Password',
                                            hintStyle: TextStyle(
                                                fontSize: 12.5.sp,
                                                color: Colors.white38),
                                            suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                _passwordVisible3
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: _passwordVisible3
                                                    ? Colors.white70
                                                    : Colors.white38,
                                              ),
                                              iconSize: 4.5.w,
                                              onPressed: () {
                                                setState(() {
                                                  _passwordVisible3 =
                                                      !_passwordVisible3;
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
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 3.25.h, left: 3.65.w, right: 3.65.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 6.5.h,
                                  width: 100.0.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: customColors
                                        .navigationBarSelectedItemColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Update Password',
                                      style: TextStyle(
                                        fontSize: 14.5.sp,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 2.25.h),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: 12.57.sp,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
