import 'package:flutter/material.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return ListView.builder(
      itemCount: vm.articles.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: (vm.articles[index].imageURL == null)
              ? Image.asset('assets/images/picture_not_found.png')
              : Image.network(vm.articles[index].imageURL),
          title: Text(
            vm.articles[index].title,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 10.0.sp,
            ),
          ),
        );
      },
    );
  }
}
