import 'package:flutter/material.dart';
import 'src/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FSW',
      routes: Routes.routes,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      )
    );
  }
}
