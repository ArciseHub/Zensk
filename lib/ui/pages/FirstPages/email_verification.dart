import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatik_projekt/ui/pages/FirstPages/registration_succesful.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

// https://codewithandrea.com/tips/easily-move-focus-scope-node/

class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final customColors = CustomColors();

  final FocusScopeNode _node = FocusScopeNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameHolder1 = TextEditingController();

  final nameHolder2 = TextEditingController();

  final nameHolder3 = TextEditingController();

  final nameHolder4 = TextEditingController();

  final nameHolder5 = TextEditingController();

  clearTextInput() {
    nameHolder1.clear();
    nameHolder2.clear();
    nameHolder3.clear();
    nameHolder4.clear();
    nameHolder5.clear();
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
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.5.w, top: 5.5.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
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
                    Container(
                      child: Center(
                        child: Image.asset(
                          'assets/images/email.png',
                          height: 45.5.h,
                          width: 42.5.w,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          SizedBox(height: 37.5.h),
                          Text(
                            'Email Verification',
                            style: TextStyle(
                              fontSize: 20.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Text(
                            'Enter the code sent to you',
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                  child: Form(
                    key: _formKey,
                    child: FocusScope(
                      node: _node,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4.0.w),
                            height: 8.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                              color: customColors.headlineBoxColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: customColors.shadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: nameHolder1,
                              onEditingComplete: _node.nextFocus,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4.0.w),
                            height: 8.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                              color: customColors.headlineBoxColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: customColors.shadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: nameHolder2,
                              onEditingComplete: _node.nextFocus,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4.0.w),
                            height: 8.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                              color: customColors.headlineBoxColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: customColors.shadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: nameHolder3,
                              onEditingComplete: _node.nextFocus,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4.0.w),
                            height: 8.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                              color: customColors.headlineBoxColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: customColors.shadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: nameHolder4,
                              onEditingComplete: _node.nextFocus,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 8.0.h,
                            width: 12.0.w,
                            decoration: BoxDecoration(
                              color: customColors.headlineBoxColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: customColors.shadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: nameHolder5,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0.sp,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive the code? ',
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(width: 1.0.w),
                    Text(
                      'RESEND',
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: customColors.navigationBarSelectedItemColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.0.h),
                GestureDetector(
                  child: Container(
                    height: 7.0.h,
                    width: 80.0.w,
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
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpSuccessful()));
                  },
                ),
                SizedBox(height: 7.5.w),
                GestureDetector(
                  onTap: clearTextInput,
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      color: Colors.white,
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
