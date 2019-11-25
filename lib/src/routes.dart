import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/networkinfo.dart';
import 'screens/camera.dart';
import 'screens/qrscanner.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String network = '/network';
  static const String camera = '/camera';
  static const String qr = '/scanner';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => MyHomePage(title: '11111'),
    network: (BuildContext context) => MyApp(),
    camera: (BuildContext context) => Camera(),
    qr: (BuildContext context) => QrScanner(),
  };
}