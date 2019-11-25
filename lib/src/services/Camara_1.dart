import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(
    new MaterialApp(
      title: "Camera App",
      home: LandingScreen(),
    )
);

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;
  _openGallery(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }
  
  _openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog (BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title:Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children:<Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              )
            ]
          ),
        ),
      );
    });
  }

  Widget _desnoseque (){
    if(imageFile == null){
      return Text('No select image');
    } else{
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _desnoseque(),
            RaisedButton(onPressed: (){
              _showChoiceDialog(context);
            },child: Text("Selected Image"),)
          ],
        )
      ),
    );
  }
}
