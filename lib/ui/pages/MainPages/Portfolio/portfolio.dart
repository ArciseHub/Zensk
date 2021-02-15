import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
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
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 2.5.h, left: 8.0.w),
                                child: Text(
                                  'Portfolio',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.5.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
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
