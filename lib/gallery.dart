import 'package:flutter/material.dart';
import 'package:flutter_app_test/gallery_data_page.dart';

class Gallery extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);


  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  TextEditingController textEditingController = new TextEditingController();
  String keyword ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('${keyword}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: 'Saisissez une ville...'),
              onChanged: (value){
                setState(() {
                  keyword = value;
                });

              },
              onSubmitted: (value){
                this.keyword = value;
                Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryDataPage(keyword)));
                textEditingController.text="";
              },
            )),
          ),
          Container(
           // width: double.infinity,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            primary: Colors.green[900],),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryDataPage(keyword)));
                textEditingController.text="";
              },
                child: Text('Get Images...')
            ),
          )
        ],
      ),
    );
  }
}
