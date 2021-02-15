import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

enum DialogAction { yes, abort }

final customColors = CustomColors();

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String message,
    String buttonText1,
    String buttonText2,
    int choseNumber,
    Widget page,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: customColors.mainBoxColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.5),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.5.sp,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          content: Container(
            height: 22.5.h,
            width: 100.0.w,
            child: Column(
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12.25.sp,
                    color: Colors.white60,
                  ),
                ),
                SizedBox(height: 3.75.h),
                GestureDetector(
                  onTap: () async {
                    if (choseNumber == 1) {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('email');
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: page,
                            inheritTheme: true,
                            ctx: context),
                      );
                    } else if (choseNumber == 2) {
                    } else {
                      Navigator.of(context).pop(DialogAction.yes);
                    }
                  },
                  child: Container(
                    height: 6.5.h,
                    width: 70.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: customColors.navigationBarSelectedItemColor,
                        width: 0.175.h,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        buttonText1,
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          color: customColors.navigationBarSelectedItemColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.0.h),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop(DialogAction.abort);
                  },
                  child: Container(
                    height: 6.5.h,
                    width: 70.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: customColors.navigationBarSelectedItemColor,
                    ),
                    child: Center(
                      child: Text(
                        buttonText2,
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
