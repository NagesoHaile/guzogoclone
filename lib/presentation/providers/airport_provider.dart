import 'package:flutter/foundation.dart';
import 'package:guzogoclone/domain/model/airport_model.dart';



 List<AirportModel> airportList = <AirportModel>[
    AirportModel(
        city: 'Addis Ababa', cityCode: 'ADD', airportName: 'Bole Int. Airport'),
    AirportModel(
        city: 'Arbaminch', cityCode: 'AMH', airportName: 'Arbaminch Airport'),
    AirportModel(city: 'Asosa ', cityCode: 'ASO', airportName: 'Asosa Airport'),
    AirportModel(
        city: 'Hawasa', cityCode: 'AWA', airportName: 'Hawasa Airport'),
    AirportModel(city: 'Aksum', cityCode: 'AXU', airportName: 'Axum Airport'),
    AirportModel(
        city: 'Dire Dawa', cityCode: 'DIR', airportName: 'Dire Dawa Airport'),
    AirportModel(
        city: 'Gambela', cityCode: 'GMB', airportName: 'Gambela Airport'),
    AirportModel(
        city: 'Jijiga', cityCode: 'JIJ', airportName: 'Jijiga Airport'),
    AirportModel(
        city: 'Shakiso', cityCode: 'SKS', airportName: 'Shakiso Airport'),
    AirportModel(cityCode: 'Sodo', city: 'SXU', airportName: 'Sodo Airport'),
    AirportModel(city: 'Tepi', cityCode: 'TEI', airportName: 'Teppi Airport'),
    AirportModel(
        city: 'Semera', cityCode: 'SZE', airportName: 'Semera Airport'),
    AirportModel(
        city: 'Nekemte', cityCode: 'NEK', airportName: 'Nekemte Airport'),
    AirportModel(city: 'Jimma', cityCode: 'JIM', airportName: 'Jimma Airport'),
    AirportModel(
        city: 'Gondar', cityCode: 'GDQ', airportName: 'Gondar Airport'),
  ];



class DepartureAirportProvider extends ChangeNotifier {
  
  AirportModel selectedDeparture = AirportModel(
      city: 'Addis Ababa', cityCode: 'ADD', airportName: 'Bole Int. Airport');
  AirportModel selectedDestination =
      AirportModel(city: '', cityCode: '', airportName: '');

 
  List<AirportModel> displayList = List.from(airportList);

  void updateList(String value) {
    displayList = airportList
        .where((element) =>
            element.city!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

 

  void selectDepartureAirport(AirportModel departure) {
    selectedDeparture = departure;
    notifyListeners();
  }
}
class DestinationAirportProvider extends ChangeNotifier {
         AirportModel selectedDestination =
      AirportModel(city: '', cityCode: '', airportName: '');
     void selectDestinationAirport(AirportModel destination) {
    selectedDestination = destination;
    notifyListeners();

  }


 List<AirportModel> displayList = List.from(airportList);

  void updateList(String value) {
    displayList = airportList
        .where((element) =>
            element.city!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
