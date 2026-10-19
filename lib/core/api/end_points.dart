import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
    final String baseUrl = 'https://newsapi.org/v2/';
    final String apiKey = dotenv.env['NEWS_API_KEY']!;
    final String sources = 'top-headlines/sources';
    final String news = 'top-headlines';
    final String search = 'everything';
}