import 'package:dio/dio.dart';

abstract class SearchDataSource {
   Future<Response> getSearchNews(String query);
 }