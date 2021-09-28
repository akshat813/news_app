import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:news_basic/Models/news.dart';
import 'package:http/http.dart' as http;

class EntertainmentNewsData {

  List<News> news = new List();
  Future<List<News>> fetchAlbum(int page) async {
    await Future.delayed(Duration(milliseconds: 1000));
    final response = await http.get('https://newsapi.org/v2/everything?q=entertainment&apiKey=b4e1f7a8e2d8452e84270587a9eddbc5&pageSize=20&page=$page');
    if (response.statusCode == 200) {
      print("EntertainmentDATA=> ::::: =>>  ${response.body}");
      var responseBody = json.decode(response.body);
      if(responseBody!=null&&responseBody["status"] == "ok") {
        var articles = responseBody["articles"];
        if(articles!=null && articles!='') {
          for(var article in articles) {
            news.add(News.fromJson(article));
          }
        }
      }
    } else {
      print("Failed to load news");
      if(news.length > 0) {
        return news;
      }
    }
    return news;
  }
}