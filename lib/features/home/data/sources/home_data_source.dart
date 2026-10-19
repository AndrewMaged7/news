import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<Response> getSources(String category);
  Future<Response> getNews(String sourceId);
}