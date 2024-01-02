import 'package:flutter/widgets.dart';

//ChangeNotifier Manages pageIndex State and Notifies all Listener whenever There is a Change in State ....
//Other Part of the App can Then Use This State to UpDate the Ui
class MainScreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  set pageIndex(int newIndexValue) {
    _pageIndex = newIndexValue;
    notifyListeners();
  }

  // pageIndex returns the Value of Private Variable _pageIndex
  int get pageIndex {
    return _pageIndex;
  }
}
