import 'package:flutter/material.dart';
import 'package:news/core/routes/routes.dart';
import 'package:news/features/categories/presentation/screens/categories_screen.dart';
import 'package:news/features/home/presentation/screens/home_screen.dart';
import 'package:news/features/search/presentation/screens/details_screen.dart';
import 'package:news/features/search/presentation/screens/search_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen(), settings: settings);
      case Routes.categories:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case Routes.details:
        return MaterialPageRoute(builder: (_) => DetailsScreen(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}