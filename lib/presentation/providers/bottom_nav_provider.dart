import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  int selectedItemIndex = 0;

  void selectItem(int value) {
    selectedItemIndex = value;
    notifyListeners();
  }
}
