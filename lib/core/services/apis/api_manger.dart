import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/sources_model.dart';

class ApiManger{

  static Future<NewsModel> getNews({String? id, String? quary})async{
    Uri url = Uri.https("newsapi.org","v2/everything",{
      "sources" : id,"q" : quary,
      "apiKey" : "8524d7c856ae49d0aa8b7d9982771950"
    });
    http.Response response = await  http.get(url);
    var json = jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }

  static Future<SourcesModel> getSources(String id)async{
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=8524d7c856ae49d0aa8b7d9982771950&category=$id");
    http.Response response = await  http.get(url);
    var json = jsonDecode(response.body);
    return SourcesModel.fromJson(json);
  }
}