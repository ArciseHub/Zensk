import 'package:flutter/cupertino.dart';
import 'package:informatik_projekt/models/newsArticle.dart';
import 'package:informatik_projekt/services/webServices.dart';
import 'package:informatik_projekt/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  //NewsSelecter
  Future<void> searchForFinancial() async {
    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword('financial');
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  Future<void> searchForChina() async {
    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword('china');
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }
}
