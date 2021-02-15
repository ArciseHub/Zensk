import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/MainPages/News/newsList.dart';
import 'package:informatik_projekt/ui/utilities/colors/colors.dart';
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.5.h, left: 8.0.w),
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
                    top: 2.5.h, left: 3.65.w, right: 3.65.w, bottom: 2.5.h),
                child: Container(
                  height: 150.0.h,
                  width: 90.0.w,
                  decoration: BoxDecoration(
                    color: customColors.headlineBoxColor,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: ChangeNotifierProvider(
                    create: (_) => NewsArticleListViewModel(),
                    child: NewsList(),
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
