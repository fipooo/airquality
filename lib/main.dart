import 'package:airquality/api/airQuality.dart';
import 'package:airquality/api/stations.dart';
import 'package:airquality/model/airIndex.dart';
import 'package:airquality/model/station.dart';
import 'package:airquality/pages/searchPage.dart';
import 'package:airquality/provider/appProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(78, 72, 115, 1),
          accentColor: Color.fromRGBO(242, 128, 87, 1),
          accentIconTheme: IconThemeData(color: Colors.white),
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Station> stationsL = new List();

  void _incrementCounter() async {
    //stationsL = await Stations().getStations();
    //stationsL.forEach((element) {print(element.city.name);});
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SearchPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.width*0.2,
              child: Image.asset(
            'assets/air.png',
            fit: BoxFit.contain,
            color: Colors.white,
          )),
        ),
      );
  }
}