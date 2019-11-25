import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

Future<void> main() async{
  //Obtains a list of the available Cameras on the device
  final cameras = await availableCameras();
  //Get a specific camera from the list of available cameras
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      home: TakePictureScreen(
        camera: firstCamera,
      ),
      ),
  );
}

//A screen that allows to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget{
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
}): super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen>{
  CameraController _controller;
  Future<void> _initilizeControllerFuture;
  @override
  void initState(){
    super.initState();
    //To display the current output from the camera, create a camer controller
    _controller = CameraController(
      //Get a specific camera from the list of available cameras
      widget.camera,
      ResolutionPreset.medium,
    );
    //Next, initialize the controller. This return a Future.
    _initilizeControllerFuture = _controller.initialize();
  }
  @override
  void dispose(){
    //Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body:FutureBuilder<void>(
        future: _initilizeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async{
          try{
            await _initilizeControllerFuture;
            final path = join(
                (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(path);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          }catch(e){
            print(e);
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget{
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
