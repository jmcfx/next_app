import 'package:flutter/widgets.dart';
import 'dart:math' as math;

//ChangeNotifier Manages pageIndex State and Notifies all Listener whenever There is a Change in State ....
//Other Part of the App can Then Use This State to UpDate the Ui
class MainScreenNotifier extends ChangeNotifier {
  final Apis _apis;

  int _pageIndex = 0;

  MainScreenNotifier({required Apis apis}) : _apis = apis;

  set pageIndex(int newIndexValue) {
    _pageIndex = newIndexValue;
    notifyListeners();
  }

  void setNewPageIndex() async {
    pageIndex=await _apis.getNumber();
  
  }

  // pageIndex returns the Value of Private Variable _pageIndex
  int get pageIndex => _pageIndex;
}

class Apis {
  Future<int> getNumber() async => math.Random().nextInt(5);
}
