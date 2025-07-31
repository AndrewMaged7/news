
import 'package:flutter/material.dart';

class CategoryData{
  String id;
  Color color;
  String title;
  String image;

  CategoryData({required this.id, required this.color, required this.title, required this.image});

  static List<CategoryData> categories = [
    CategoryData(id: "sports", color: Colors.red, title: "Sports", image: "ball.png"),
    CategoryData(id: "politics", color: Colors.blueAccent, title: "Politics", image: "Politics.png"),
    CategoryData(id: "health", color: Colors.purpleAccent, title: "Health", image: "health.png"),
   CategoryData(id: "business", color: Colors.brown, title: "Business", image: "business.png"),
    CategoryData(id: "environment", color: Colors.lightBlue, title: "Environment", image: "environment.png"),
    CategoryData(id: "science", color: Colors.yellowAccent, title: "science", image: "science.png")
  ];
}