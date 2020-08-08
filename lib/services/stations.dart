import 'dart:convert';

import 'package:airquality/model/city.dart';
import 'package:airquality/model/commune.dart';
import 'package:airquality/model/station.dart';
import 'package:http/http.dart' as http;

class Stations {
  final url = 'http://api.gios.gov.pl/pjp-api/rest/station/findAll';

  Future<List<Station>> getStations() async {
    List<Station> stationList = new List();
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List tmpMap = json.decode(response.body);

      tmpMap.forEach((value) {
        stationList.add(Station(
            id: value['id'],
            city: City(
                id: value['city']['id'],
                name: value['city']['name'],
                commune: Commune(
                    communeName: value['city']['commune']['communeName'],
                    districtName: value['city']['commune']['districtName'],
                    provinceName: value['city']['commune']['provinceName'])),
            gegrLat: value['gegrLat'],
            gegrLon: value['gegrLon'],
            stationName: value['stationName']));
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return stationList;
  }
}
