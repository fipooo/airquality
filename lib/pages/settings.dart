import 'package:airquality/api/airQuality.dart';
import 'package:airquality/api/spChecker.dart';
import 'package:airquality/api/stations.dart';
import 'package:airquality/provider/appProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsSheet extends StatefulWidget {
  final AppProvider appProvider;
  final AppProvider appConsumer;
  SettingsSheet({@required this.appConsumer, @required this.appProvider});
  @override
  _SettingsSheetState createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  TextEditingController _textEditingController = new TextEditingController();


  checkCitiesList()async{
    print(widget.appConsumer.stationList);
    if(widget.appConsumer.stationList == null){
      widget.appProvider.stationList = await Stations().getStations();
    }
  }

  @override
  void initState() {
    checkCitiesList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      body: Consumer<AppProvider>(
        builder: (context, appConsumer, _) => Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: width*0.8,
                height: 100,
                color: Colors.white,
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: TextField(
                    controller: _textEditingController,
                    onChanged: (value){

                    },
                    onEditingComplete: (){
                      appProvider.searchInCities(_textEditingController.text);
                      print(_textEditingController.text);
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Wyszukaj miasta",
                        fillColor: Colors.white70),
                  ),
                ),
              ),
              Container(
                width: width,
                height: height*0.75,
                child: appConsumer.searchStation ==null || appConsumer.searchStation.length == 0 ?
                Center(
                  child: Text('Brak danych'),
                ) : ListView(
                  children: List.generate(appConsumer.searchStation == null ? 0 : appConsumer.searchStation.length, (index){
                    return  GestureDetector(
                      onTap: () async {
                        SharedPreferencesChecker().saveCity(appConsumer.searchStation[index].city.name);
                        SharedPreferencesChecker().saveStationId(appConsumer.searchStation[index].id);
                        appProvider.airIndex = await AirQuality().getAirQuality(appConsumer.searchStation[index].id);
                        appProvider.city = appConsumer.searchStation[index].city;
                        appProvider.station = appConsumer.searchStation[index];
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(15.0))
                        ),
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        width: width*0.5,
                        height: 100,
                        child: Center(
                          child: Text('Miasto: ${appConsumer.searchStation[index].city.name} Nazwa: ${appConsumer.searchStation[index].stationName}',textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
