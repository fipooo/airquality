import 'package:airquality/model/city.dart';
import 'package:flutter/cupertino.dart';

class Station {
  int id;
  String stationName;
  String gegrLat;
  String gegrLon;
  City city;
  String addressStreet;

  Station({
    @required this.id,
    @required this.city,
    @required this.gegrLat,
    @required this.gegrLon,
    @required this.stationName,
    this.addressStreet,
  });
}
