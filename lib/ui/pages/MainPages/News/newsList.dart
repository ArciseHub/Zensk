import 'package:flutter/material.dart';
import 'package:informatik_projekt/viewmodels/newsArticleViewModel.dart';
import 'package:sizer/sizer.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsList({this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.0.h, bottom: 0.5.h),
              child: ListTile(
                leading: (article.imageURL == null)
                    ? Container(
                        height: 16.5.h,
                        width: 22.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Image.asset('assets/images/picture_not_found.png'))
                    : Container(
                        height: 15.0.h,
                        width: 22.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(article.imageURL)),
                title: Column(
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 10.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
              color: Colors.white38,
              height: 0.025.h,
              width: 86.5.w,
            ),
          ],
        );
      },
    );
  }
}
