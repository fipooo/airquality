import 'package:airquality/model/commune.dart';
import 'package:flutter/cupertino.dart';

class City {
  int id;
  String name;
  Commune commune;

  City({@required this.id, @required this.name, @required this.commune});
}
