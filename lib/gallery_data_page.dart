import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDataPage extends StatefulWidget {
  // const GalleryDataPage({Key? key}) : super(key: key);
  String keyword;

  GalleryDataPage(this.keyword);
  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  Map dataImage;
  int currentPage = 1;
  int size = 10;
  List<dynamic> hits =[];
  int totalPage;
  ScrollController _scrollController = new ScrollController();
  Future<http.Response> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=22174959-524063d4bd9069a613c2023bd&q=${widget.keyword}&page=${currentPage}&per_page=${size}'));
    try {
      if (response.statusCode == 200) {
        setState(() {
          dataImage = jsonDecode(response.body);

          hits.addAll(dataImage['hits']);
          if(dataImage['totalHits']%size == 0)
          {
            totalPage = dataImage['totalHits']~/size;
          }else{
            totalPage =1+ (dataImage['totalHits']/size).floor();
          }
        });
        print(hits);
      }
    } catch (e) {
      print('il y a un petit souci de récupération de données');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        if(currentPage<totalPage){
          ++currentPage;
          this.getData();
        }

      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "${widget.keyword}, page ${currentPage}/${totalPage}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 10,
        ),
        body: (dataImage == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: (dataImage == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(

                                hits[index]['tags'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Image.network(hits[index]['webformatURL'],
                          fit: BoxFit.fitWidth,
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                      ),
                    ],
                  );
                })));
  }
}
