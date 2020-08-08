import 'package:airquality/model/airIndex.dart';
import 'package:airquality/model/city.dart';
import 'package:airquality/model/station.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier{
  bool _menu;
  City _city;
  List<Station> _stationList;
  List<Station> _searchStation;
  Station _station;
  AirIndex _airIndex;

  Station get station => _station;
  bool get menu => _menu;
  City get city => _city;
  List<Station> get stationList => _stationList;
  List<Station> get searchStation => _searchStation;
  AirIndex get airIndex => _airIndex;

  set airIndex(AirIndex tmpAirIndex){
    _airIndex = tmpAirIndex;
    notifyListeners();
  }

  set station(Station tmpStation){
    _station = _station;
    notifyListeners();
  }

  void searchInCities(String phrase){
    List<Station> tmpState = new List();
    _stationList.forEach((element) {
      if(element.city.name.toLowerCase().contains(phrase.toLowerCase())){
        tmpState.add(element);
      }
    });
    searchStation = tmpState;
    notifyListeners();
  }

  set searchStation(List<Station> tmpList){
    _searchStation = tmpList;
    notifyListeners();
  }

  set stationList(List<Station> tmpList){
    _stationList = tmpList;
    notifyListeners();
  }

  set city(City tmpCity){
    _city = tmpCity;
    notifyListeners();
  }

  set menu(bool tmpSetMenu){
    _menu = tmpSetMenu;
    notifyListeners();
  }
}