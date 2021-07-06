import 'package:flutter/material.dart';

import 'main_drawer.dart';

void main() => runApp(MaterialApp(
  home:Home(),
));

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int compteur = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Synthèse',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 3.0
        ),
        ),
        centerTitle: true,
        elevation: 10,
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('la valeur de l incrementation est: $compteur',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      letterSpacing: 1.5
                  ),
                ),
              ),
              SizedBox(height: 30),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    compteur+=1;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],

        ),

      ),


    );
  }
}
