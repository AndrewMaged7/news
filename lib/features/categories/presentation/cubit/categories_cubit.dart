import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> categoriesNames = [
    'Sports',
    'Technology',
    'Health',
    'Business',
    'Entertainment',
    'Science',
  ];

  List<Color> categoryColors = [
    Color(0xFFC91C22),
    Color(0xFF003E90),
    Color(0xFFED1E79),
    Color(0xFFCF7E48),
    Color(0xFF4882CF),
    Color(0xFFF2D352),
  ];

  List<String> categoryImages = [
    'images/sports.png',
    'images/Politics.png',
    'images/health.png',
    'images/bussines.png',
    'images/environment.png',
    'images/science.png',
  ];
}
