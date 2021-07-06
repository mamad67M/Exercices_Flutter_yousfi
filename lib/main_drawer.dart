import 'package:flutter/material.dart';
import 'quiz.dart';
import 'camera.dart';
import 'gallery.dart';
import 'weather.dart';

class MainDrawer extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 50, backgroundImage: AssetImage('assets/mamad.JPG'),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green[900], Colors.white])
            ),

          ),
          ListTile(
            title: Text('Quiz', style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()) ) ;},
          ),

          Divider(height: 5, color: Colors.green,),

          ListTile(
            title: Text('Weather', style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Weather()) ) ;
            },
          ),

          Divider(height: 5, color: Colors.green,),

          ListTile(
            title: Text('Gallery', style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()) ) ;
            },
          ),

          Divider(height: 5, color: Colors.green,),

          ListTile(
            title: Text('Camera', style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()) ) ;
            },
          ),
        ],
      ),
    );
  }
}
