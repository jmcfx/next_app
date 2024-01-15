import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

// active page setter...
  set activePage(int newActivePage) {
    _activePage = newActivePage;
    notifyListeners();
  }

// active page getter...
  int get activePage => _activePage;

  //shoeSizes setter...
  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  //ShoesSize getter...
  List<dynamic> get shoeSizes => _shoeSizes;

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]["isSelected"] = !_shoeSizes[i]["isSelected"];
      }
    }
    notifyListeners();
  }

//Sizes getter...
  List<String> get sizes => _sizes;

//Sizes setter....
  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }
}
