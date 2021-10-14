// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String Url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=705e4eca8fba45c6b8480b040d3a2de1';
    var response = await http.get(Uri.parse(Url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            element['title'],
            element['description'],
            element['url'],
            element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String Url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&category=business&apiKey=705e4eca8fba45c6b8480b040d3a2de1';
    var response = await http.get(Uri.parse(Url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            element['title'],
            element['description'],
            element['url'],
            element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
