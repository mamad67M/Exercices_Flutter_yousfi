import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        child: Center(child: Text('Camera Page',style: TextStyle(fontSize: 22))),
      ),
    );
  }
}
