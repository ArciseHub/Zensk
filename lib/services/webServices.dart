import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:informatik_projekt/models/newsArticle.dart';
import 'package:informatik_projekt/ui/pages/MainPages/News/news.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final url =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=38ecfbfc562141a6829c6ccf0057d9c0";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=38ecfbfc562141a6829c6ccf0057d9c0";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
