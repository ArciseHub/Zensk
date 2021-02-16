import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/MainPages/News/newsList.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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
                                  'News',
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
                            padding: EdgeInsets.only(
                                top: 2.5.h,
                                left: 3.65.w,
                                right: 3.65.w,
                                bottom: 2.5.h),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 90.0.w,
                                maxWidth: 90.0.w,
                                minHeight: 10.0.h,
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: customColors.headlineBoxColor,
                                borderRadius: BorderRadius.circular(7.5),
                              ),
                              child: ChangeNotifierProvider(
                                create: (_) => NewsArticleListViewModel(),
                                child: Column(
                                  children: [
                                    NewsList(),
                                    SizedBox(height: 2.5.h),
                                  ],
                                ),
                              ),
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
