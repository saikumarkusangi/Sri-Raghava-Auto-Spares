import 'package:flutter/material.dart';

class CarouselIndexController extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(index){
    _currentIndex = index;
    notifyListeners();
  }
}