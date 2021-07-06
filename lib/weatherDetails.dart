import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart';

class WeatherDetails extends StatefulWidget {
  // const WeatherDetails({Key? key}) : super(key: key);
  String ville;
  WeatherDetails(this.ville);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  Map meteoData;
  getMeteoData(String ville) async {
    Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/forecast?q=${ville}&appid=439d4b804bc8187953eb36d2a8c26a02'));
    try {
      setState(() {
        meteoData = jsonDecode(response.body);
      });
      print(meteoData);
    } catch (e) {
      print(e);
      ville = 'pas accessible...';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMeteoData(widget.ville);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text('Weather de ${widget.ville}'),
        ),
        body: (meteoData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: (meteoData == null ? 0 : meteoData['list'].length),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${new DateFormat('HH:mm')
                                        .format(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            meteoData['list'][index]['dt'] * 1000000))}"
                                            " | ${meteoData['list'][index]['weather'][0]['main']}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "${meteoData['list'][index]['main']['temp'].round()}°K",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
