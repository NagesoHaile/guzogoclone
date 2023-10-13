import 'package:flutter/material.dart';

class TripWayProvider extends ChangeNotifier {
  bool tripWay = true;

  toggleTripWay(bool newTripway) {
    tripWay = newTripway;
    notifyListeners();
  }
}
