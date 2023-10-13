import 'package:flutter/material.dart';
import 'package:guzogoclone/domain/model/passenger_model.dart';

class PassengerProvider extends ChangeNotifier {
  int _adultCount = 0;
  int _childrenCount = 0;
  int _infantCount = 0;
  List<int> counts = [];
  PassengerModel adult = PassengerModel(category: "Adult", count: 0);
  PassengerModel children = PassengerModel(category: "Children", count: 0);
  PassengerModel infant = PassengerModel(category: "Infant", count: 0);
  List<PassengerModel> passenger = [
    PassengerModel(category: "Adult", count: 0),
    PassengerModel(category: "Children", count: 0),
    PassengerModel(category: "Infant", count: 0),
  ];

  int get adultCount => _adultCount;
  int get childrenCount => _childrenCount;
  int get infantCount => _infantCount;

  //adult count inc and dec
  void incrementAdultCount() {
    _adultCount++;
    notifyListeners();
  }

  void decrementAdultCount() {
    _adultCount--;
    notifyListeners();
  }

// children count inc and dec
  void incrementChildrenCount() {
    _childrenCount++;
    notifyListeners();
  }

  void decrementChildrenCount() {
    _childrenCount--;
    notifyListeners();
  }

  //infant count inc and dec
  void incrementInfantCount() {
    _infantCount++;
    notifyListeners();
  }

  void decrementInfantCount() {
    _infantCount--;
    notifyListeners();
  }
}
