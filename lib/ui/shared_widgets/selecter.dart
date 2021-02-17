import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Selecter extends StatefulWidget {
  Selecter({this.text});
  final String text;

  @override
  _SelecterState createState() => _SelecterState();
}

class _SelecterState extends State<Selecter> {
  final customColors = CustomColors();
  bool taped = false;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Padding(
      padding: EdgeInsets.only(right: 1.5.w),
      child: GestureDetector(
        onTap: () {
          //TODO  When put in here (vm.searchForChina), it gives the news related with china.
          //TODO The Problem is that I cant create a constructor variable to put in there so I can set the different searchFor functions
          setState(() {
            taped = !taped;
          });
        },
        child: Container(
          height: 3.5.h,
          constraints: BoxConstraints(
            minWidth: 2.5.w,
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: taped
                ? customColors.navigationBarSelectedItemColor
                : customColors.headlineBoxColorAccent,
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: taped ? Colors.white : Colors.white60,
                  fontSize: 12.5.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
