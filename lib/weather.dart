import 'package:flutter/material.dart';
import 'package:flutter_app_test/weatherDetails.dart';

class Weather extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);


  @override
  _WeatherState createState() => _WeatherState();

}

class _WeatherState extends State<Weather> {

  String ville = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Weather de : $ville',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        ),

        elevation: 10,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(

              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Saisissez une ville...'),
                onChanged:(String value){
                  setState(() {
                    this.ville =value;
                  });
                },
                onSubmitted: (value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(ville)));
                  textEditingController.text = "";
                },

              ),
            ),
          ),

           SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[900],
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(ville)));
                    textEditingController.text = "";
                  },
                  child: Text('Get Weather...')
              ),
            ),
          )
        ],
      ),
    );
  }
}
