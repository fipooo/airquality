import 'package:airquality/provider/appProvider.dart';
import 'package:airquality/components/menuButton.dart';
import 'package:airquality/screens/settings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool city;
  final AppProvider appProvider;
  final AppProvider appConsumer;

  CustomAppBar(this.city,
      {@required this.appProvider, @required this.appConsumer});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      width: width,
      height: 50,
      child: Row(
          children: [
          MenuButton(
          size: 30,
          dark: false,
          onPressed: () {
            //SettingsSheet();
          }
      ),
      Spacer(),
      Text(appConsumer.city == null ? "Brak miasta" : appConsumer.city.name, style: TextStyle(
          fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),),
      Spacer(),
      RawMaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>
              SettingsSheet(
                  appConsumer: appProvider, appProvider: appConsumer)));},
        child: Icon(
        Icons.settings,
        color: Colors.white,
        size: 30,
      ),
    ),]
    ,
    )
    ,
    );
  }
}
