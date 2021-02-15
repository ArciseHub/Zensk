import 'package:flutter/material.dart';
import 'package:informatik_projekt/viewmodels/newsArticleListViewModel.dart';

class NewsList extends StatelessWidget {
  NewsArticleListViewModel _newsArticleListViewModel =
      NewsArticleListViewModel();

  NewsList() {
    _newsArticleListViewModel.populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
