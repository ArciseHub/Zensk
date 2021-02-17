import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:informatik_projekt/ui/pages/MainPages/News/newsList.dart';
import 'package:informatik_projekt/ui/shared_widgets/selecter.dart';
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
  final _controller = TextEditingController();
  final customColors = CustomColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                                  top: 2.5.h, left: 3.65.w, right: 3.65.w),
                              child: Container(
                                height: 5.0.h,
                                width: 90.0.h,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: _controller,
                                    onSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        vm.search(value);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter search term',
                                      border: InputBorder.none,
                                      icon: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Icon(Icons.search),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.clear),
                                        splashRadius: 20,
                                        onPressed: () {
                                          _controller.clear();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 2.0.h, bottom: 1.5.h),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  //TODO Also change the customColors.headlinebox zo .headlineboxAccent => will look better maybe
                                  children: [
                                    SizedBox(width: 3.65.w),
                                    Selecter(text: 'Financial'),
                                    Selecter(text: 'Stock Market'),
                                    Selecter(text: 'USA'),
                                    Selecter(text: 'China'),
                                    Selecter(text: 'Germany'),
                                    SizedBox(width: 3.65.w),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 2.0.h,
                                  left: 3.65.w,
                                  right: 3.65.w,
                                  bottom: 2.5.h),
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: 90.0.w,
                                  maxWidth: 90.0.w,
                                  minHeight: double.minPositive,
                                  maxHeight: double.infinity,
                                ),
                                decoration: BoxDecoration(
                                  color: customColors.headlineBoxColor,
                                  borderRadius: BorderRadius.circular(7.5),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 2.50.h),
                                    NewsList(articles: vm.articles),
                                    SizedBox(height: 2.5.h),
                                  ],
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
      ),
    );
  }
}
