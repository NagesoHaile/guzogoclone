import 'package:flutter/foundation.dart';
import 'package:guzogoclone/domain/model/cabin_class.dart';

class CabinClassProvider extends ChangeNotifier {
  String selectedCabinClass = "Business";
  List<CabinClass> cabinClass = [
    CabinClass(name: 'Business'),
    CabinClass(name: 'Economy'),
    CabinClass(name: 'First'),
  ];

  void selectCabinClass(String value) {
    selectedCabinClass = value;
    notifyListeners();
  }
}
