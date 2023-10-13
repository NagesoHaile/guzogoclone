import 'package:flutter/material.dart';
import 'package:guzogoclone/domain/model/passenger_model.dart';

class PassengerProvider extends ChangeNotifier {
  int adultCount = 0;
  int childrenCount = 0;
  int infantCount = 0;
  PassengerModel adult = PassengerModel(category: "Adult", count: 0);
  PassengerModel children = PassengerModel(category: "Children", count: 0);
  PassengerModel infant = PassengerModel(category: "Infant", count: 0);
  List<PassengerModel> passenger = [
    PassengerModel(category: "Adult", count: 0),
    PassengerModel(category: "Children", count: 0),
    PassengerModel(category: "Infant", count: 0),
  ];

  void updateAdultCount(PassengerModel adult) {
    adultCount = adult.count;
    notifyListeners();
  }

  void updateChildrenCount(PassengerModel children) {
    childrenCount = children.count;
    notifyListeners();
  }

  void updateInfantCount(PassengerModel infant) {
    infantCount = infant.count;
    notifyListeners();
  }

  void incrementAdultCount(count) {
    count++;
    notifyListeners();
  }

  void decrementAdultCount(count) {
    count--;
    notifyListeners();
  }
}
