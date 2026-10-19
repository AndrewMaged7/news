import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/features/search/data/sources/search_data_source.dart';


@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {
  ApiManager apiManager;
  SearchDataSourceImpl(this.apiManager);
  @override
  Future<Response> getSearchNews(String query) async {
    return await apiManager.get(endPoint: apiManager.endPoints.search, queryParameters: {
      'q': query,
      // "language": "en",
      "sortBy": "publishedAt",
      'apiKey': apiManager.endPoints.apiKey,});
  }
}