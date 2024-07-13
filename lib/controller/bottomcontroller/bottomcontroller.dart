import 'package:flutter/material.dart';

class BottomController extends ChangeNotifier {
  int currentindex = 0;
  onTapped(index) {
    currentindex = index;
    notifyListeners();
  }
}
