import 'package:flutter/cupertino.dart';

class Param {
  String paramName;
  String paramFormula;
  String paramCode;
  int irdParam;

  Param(
      {@required this.irdParam,
      @required this.paramCode,
      @required this.paramFormula,
      @required this.paramName});
}
