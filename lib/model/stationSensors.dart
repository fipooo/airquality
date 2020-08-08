import 'package:airquality/model/param.dart';
import 'package:flutter/cupertino.dart';

class StationSensors{
  int id;
  int stationID;
  Param param;
  StationSensors({@required this.param, @required this.id, @required this.stationID});
}