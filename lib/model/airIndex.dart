import 'package:airquality/model/coIndexLevel.dart';
import 'package:airquality/model/no2IndexLevel.dart';
import 'package:airquality/model/o3IndexLevel.dart';
import 'package:airquality/model/pm10IndexLevel.dart';
import 'package:airquality/model/pm25IndexLevel.dart';
import 'package:airquality/model/so2IndexLevel.dart';
import 'package:airquality/model/stIndexLevel.dart';
import 'package:flutter/cupertino.dart';

class AirIndex {
  int id;
  DateTime dateTime;
  StIndexLevel stIndexLevel;
  No2IndexLevel no2indexLevel;
  O3IndexLevel o3indexLevel;
  Pm10IndexLevel pm10indexLevel;
  Pm25IndexLevel pm25indexLevel;
  So2IndexLevel so2indexLevel;
  CoIndexLevel coIndexLevel;

  AirIndex(
      {this.stIndexLevel,
        @required this.id,
        @required this.dateTime,
        this.pm25indexLevel,
        this.pm10indexLevel,
        this.o3indexLevel,
        this.no2indexLevel,
        this.coIndexLevel,
        this.so2indexLevel});
}
