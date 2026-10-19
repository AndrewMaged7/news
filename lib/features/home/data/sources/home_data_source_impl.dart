import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/features/home/data/sources/home_data_source.dart';


@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  ApiManager apiManager;
  HomeDataSourceImpl(this.apiManager);

  @override
  Future<Response> getSources(String category) async {
    return await apiManager.get(endPoint: apiManager.endPoints.sources, queryParameters: {
      'apiKey': apiManager.endPoints.apiKey,
      'category': category,
    },);
  }

  @override
  Future<Response> getNews(String sourceId) async {
    return await apiManager.get(
      endPoint: apiManager.endPoints.news,
      queryParameters: {
        'sources': sourceId,
        'apiKey': apiManager.endPoints.apiKey,
      },
    );
  }
}