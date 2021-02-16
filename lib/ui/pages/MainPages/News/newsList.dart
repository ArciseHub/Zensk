import 'package:flutter/material.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
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

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vm.articles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.0.h, bottom: 0.5.h),
              child: ListTile(
                leading: (vm.articles[index].imageURL == null)
                    ? Container(
                        height: 16.5.h,
                        width: 22.5.w,
                        child:
                            Image.asset('assets/images/picture_not_found.png'))
                    : Container(
                        height: 15.0.h,
                        width: 22.5.w,
                        child: Image.network(vm.articles[index].imageURL)),
                title: Text(
                  vm.articles[index].title,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10.0.sp,
                  ),
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
