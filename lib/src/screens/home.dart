import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meanin
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Take photo'),
            onTap: () {
              Navigator.pushNamed(context, '/camera');
            },
          ),
          ListTile(
            leading: Icon(Icons.network_wifi),
            title: Text('Network INFO'),
            onTap: () {
              Navigator.pushNamed(context, '/network');
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('QR scanner'),
            onTap: () {
              Navigator.pushNamed(context, '/scanner');
            },
          ),
        ],
      ),
    );
  }
}
