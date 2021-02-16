import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final customColors = CustomColors();
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
                                  'Search',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.5.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
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
