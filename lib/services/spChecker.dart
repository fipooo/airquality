import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesChecker{

  Future<bool> checkSavedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String saved = prefs.getString('city');
    bool savedBool = false;

    if(saved != null){
      if(saved.isNotEmpty )savedBool = true;
    }

    return savedBool;
  }

  saveCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', cityName);
  }

  saveStationId(int stationID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('station', stationID);
  }

}