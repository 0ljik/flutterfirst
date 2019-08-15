import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:first/models/users.dart';
import 'package:first/models/drivers.dart';
import 'package:first/classes/jsonreader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
//import 'package:location/location.dart';
import './pages/registration_page.dart';


void main() => runApp(MyApp());

/*class DataLogic {
  dynamic readFile(String filename) async {
    var file = File(filename);
    String contents;

    if (await file.exists()) {
      // Read file
      contents = await file.readAsString();
      return contents;
    }
  }
  dynamic writeFile(String filename, var contents) async {
      // Write file
      String json = jsonEncode(contents);
      var fileCopy = await File(filename).writeAsString(json);
      if (await fileCopy.exists()){
        return 1;
      }
      return 0;
  }
  dynamic getUser(){
    Map userMap = jsonDecode(this.readFile("users.json"));
    var user = User.fromJson(userMap);
    return user;
  }
  dynamic getDriver(){
    Map userMap = jsonDecode(this.readFile("users.json"));
    var driver = Driver.fromJson(userMap);
    return driver;
  }
}*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/signup' : (BuildContext context) => new RegistrationPage()
      },
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: RegistrationPage(),
      ),
    );
  }
}*/
 
class MyApp extends StatelessWidget {
  //final DataLogic dataLogic;
  //MyApp(this.dataLogic);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/signup' : (BuildContext context) => new RegistrationPage()
      },
      title: 'TMS Client',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatefulWidget {
  //final DataLogic dataLogic;
  //HomePage(this.dataLogic);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Marker> _markers;
  Marker _marker;
  Timer _timer;
  //Location location = Location();
 
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        //location.getLocation().then((p) {
          _marker = Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(49.8021, 73.0894),//p.latitude, p.longitude),
            builder: (ctx) => Container(
              child: Icon(Icons.directions_car),
            ),
          );
        //});
        /* for(var i = 0; i < locDrivers.length; i++){
            list.add(
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(49.8098, 73.0833),
                  builder: (ctx) => Container(
                    child: Icon(Icons.directions_car),
                  ),
                )
            );
          }*/
      });
    });
  }
 
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
 
  @override
  Widget build(BuildContext context) {
    if (_marker == null) {
      return new Container();
    }
 
    return Scaffold(
      appBar: new AppBar(title: new Text("Карта")),
      body: FlutterMap(
        options: new MapOptions(
          center: _marker.point,
          zoom: 12.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(markers: [_marker]),
        ],
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Icon(Icons.account_circle),
                  backgroundColor: Colors.blue,
                heroTag: 'fab01',
                ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: () {
                    //var user = DataLogic.getUser();
                    print('pressed');
                  },
                  child: Icon(Icons.account_circle),
                  backgroundColor: Colors.blue,
                heroTag: 'fab02',
                ),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: EdgeInsets.only(left:30, right: 30, top:80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.account_circle),
                      backgroundColor: Colors.blue,
                      heroTag: 'fab03',
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.account_circle),
                      backgroundColor: Colors.blue,
                      heroTag: 'fab04',
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.account_circle),
                      backgroundColor: Colors.blue,
                      heroTag: 'fab05',
                    ),
                  ],
            )
          ),
          ),
        ],
      ),
      ),
    );
  }
}