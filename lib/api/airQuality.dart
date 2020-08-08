import 'dart:convert';

import 'package:airquality/model/airIndex.dart';
import 'package:airquality/model/coIndexLevel.dart';
import 'package:airquality/model/no2IndexLevel.dart';
import 'package:airquality/model/o3IndexLevel.dart';
import 'package:airquality/model/pm10IndexLevel.dart';
import 'package:airquality/model/pm25IndexLevel.dart';
import 'package:airquality/model/so2IndexLevel.dart';
import 'package:airquality/model/stIndexLevel.dart';
import 'package:http/http.dart' as http;

class AirQuality {
  final url = 'http://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex/';

  Future<AirIndex> getAirQuality(int stationID) async {
    AirIndex airIndex;
    print(stationID);

    final response = await http.get('$url$stationID');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var airIndexResponse = json.decode(response.body);

      print(airIndexResponse['pm10IndexLevel']);

      airIndex = new AirIndex(
          stIndexLevel: airIndexResponse['stIndexLevel'] != null ?StIndexLevel(
              id: airIndexResponse['stIndexLevel']['id'],
              indexLevelName: airIndexResponse['stIndexLevel']
                  ['indexLevelName']) : null,
          no2indexLevel: airIndexResponse['no2IndexLevel'] != null ? No2IndexLevel(indexLevelName: airIndexResponse['no2IndexLevel']['indexLevelName']) : null,
          o3indexLevel: airIndexResponse['o3IndexLevel'] != null ? O3IndexLevel(indexLevelName: airIndexResponse['o3IndexLevel']['indexLevelName']) : null,
          pm10indexLevel: airIndexResponse['pm10IndexLevel'] != null ? Pm10IndexLevel(indexLevelName: airIndexResponse['pm10IndexLevel']['indexLevelName']) : null,
          pm25indexLevel: airIndexResponse['pm25IndexLevel'] != null ? Pm25IndexLevel(indexLevelName: airIndexResponse['pm25IndexLevel']['indexLevelName']) : null,
          so2indexLevel: airIndexResponse['so2IndexLevel'] != null ? So2IndexLevel(indexLevelName: airIndexResponse['so2IndexLevel']['indexLevelName']) : null,
          coIndexLevel: airIndexResponse['coIndexLevel'] != null ? CoIndexLevel(indexLevelName: airIndexResponse['coIndexLevel']['indexLevelName']) : null,
          id: airIndexResponse['id'],
          dateTime: DateTime.parse(airIndexResponse['stCalcDate']));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return airIndex;
  }
}
