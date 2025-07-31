
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  String selectedLocal = "English";

  void changeLocal(String lang) {
    if (selectedLocal == lang) {
      return;
    }
    selectedLocal = lang;
    notifyListeners();
  }
}