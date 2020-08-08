import 'package:flutter/material.dart';

class AirLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Container(
      width: width/2,
      height: width/2,
      child: Image.asset('assets/sad.png',),
    );
  }
}
