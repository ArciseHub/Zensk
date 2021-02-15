import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _scrollController = ScrollController();
  final customColors = CustomColors();

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
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.5.h, left: 8.0.w),
                            child: Row(
                              children: [
                                Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.5.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.5.h, left: 3.65.w),
                                  child: Container(
                                    height: 9.15.h,
                                    width: 45.0.w,
                                    decoration: BoxDecoration(
                                      color: customColors.headlineBoxColor,
                                      borderRadius: BorderRadius.circular(7.5),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.white38,
                                            size: 6.35.w,
                                          ),
                                          SizedBox(width: 2.075.w),
                                          Text(
                                            'Watchlist',
                                            style: TextStyle(
                                                fontSize: 14.95.sp,
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.5.h, left: 1.65.w),
                                  child: Container(
                                    height: 9.15.h,
                                    width: 45.0.w,
                                    decoration: BoxDecoration(
                                      color: customColors.headlineBoxColor,
                                      borderRadius: BorderRadius.circular(7.5),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.white38,
                                            size: 6.35.w,
                                          ),
                                          SizedBox(width: 2.075.w),
                                          Text(
                                            'Watchlist',
                                            style: TextStyle(
                                                fontSize: 14.95.sp,
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.5.h, left: 1.65.w),
                                  child: Container(
                                    height: 9.15.h,
                                    width: 45.0.w,
                                    decoration: BoxDecoration(
                                      color: customColors.headlineBoxColor,
                                      borderRadius: BorderRadius.circular(7.5),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.white38,
                                            size: 6.35.w,
                                          ),
                                          SizedBox(width: 2.075.w),
                                          Text(
                                            'Watchlist',
                                            style: TextStyle(
                                                fontSize: 14.95.sp,
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
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
                                    'Your Portfolio',
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
                                    height: 32.25.h,
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
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Colors.white38,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                    'Your Watchlist',
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
                                    height: 32.25.h,
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
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Colors.white38,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                    'Your Goal',
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
                                              top: 2.5.h,
                                              left: 3.75.w,
                                              right: 3.75.w,
                                              bottom: 1.5.h),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Colors.white38,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
