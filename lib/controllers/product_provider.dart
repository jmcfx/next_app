import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;

  set activePage(int newActivePage) {
    _activePage = newActivePage;
    notifyListeners();
  }

  int get activePage => _activePage;
}
