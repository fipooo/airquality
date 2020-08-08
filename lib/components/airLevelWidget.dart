import 'package:flutter/material.dart';

class AirLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Container(
      width: width/2,
      height: width/2,
      child: Image.asset('assets/sad.png',),
    );
  }
}
