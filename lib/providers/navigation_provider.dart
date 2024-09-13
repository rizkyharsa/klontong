import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int currentIndex = 0;

  int get currentPage => currentIndex;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
