import 'package:flutter/material.dart';
class UserBottomBarProvider extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  setcurrentIndex(int value){
    _currentIndex = value;
    notifyListeners();
  }
}