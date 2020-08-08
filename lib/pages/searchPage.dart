import 'package:airquality/api/spChecker.dart';
import 'package:airquality/api/stations.dart';
import 'package:airquality/model/station.dart';
import 'package:airquality/provider/appProvider.dart';
import 'package:airquality/widgets/appBar.dart';
import 'package:airquality/widgets/card.dart';
import 'package:airquality/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool checked = false;

  checkCity() async {
    bool checkedTmp = await SharedPreferencesChecker().checkSavedCity();
    setState(() {
      if (checkedTmp == null)
        checked = false;
      else {
        print('hello');
        checked = checkedTmp;
      }
    });
  }

  @override
  void initState() {
    checkCity();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Consumer<AppProvider>(
      builder: (context, appConsumer, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: RadialGradient(radius: 7.0,
                  //end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ])),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(checked, appConsumer: appConsumer, appProvider: appProvider,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Tlenek węgla',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.coIndexLevel != null?appConsumer.airIndex.coIndexLevel.indexLevelName:'',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),
                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Dwutlenek azotu',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.no2indexLevel != null? appConsumer.airIndex.no2indexLevel.indexLevelName : '',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Pył MP2,5',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.pm25indexLevel != null? appConsumer.airIndex.pm10indexLevel.indexLevelName: '',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),
                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Pył MP10',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.pm25indexLevel != null?appConsumer.airIndex.pm25indexLevel.indexLevelName:'',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Dwutlenek siarki',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.so2indexLevel != null? appConsumer.airIndex.so2indexLevel.indexLevelName : '',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),                      CustomCardWidget(
                        width: width,
                        height: height,
                        name: 'Ozon',
                        text: appConsumer.airIndex != null && appConsumer.airIndex.o3indexLevel != null? appConsumer.airIndex.o3indexLevel.indexLevelName:'',
                        appConsumer: appConsumer,
                        appProvider: appProvider,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}