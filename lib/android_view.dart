import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import "dart:convert";

class Android extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AndroidState();
  }
}

class AndroidState extends State<Android> {

  String _test = "Android";


  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(_test),
    ));
  }

  loadData() async {
//    var url = "https://gank.io/api/data/Android/10/1";
//    var httpClient = HttpClient();
//
//    String result = "";
//    try {
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.OK) {
//        var json = await response.transform(UTF8.decoder).join();
//        var data = JSON.decode(json);
//        result = data['origin'];
//      } else {
//        result =
//        'Error getting data:\nHttp status ${response.statusCode}';
//      }
//    } catch (exception) {
//      debugPrint(exception.toString());
//        result = "failed load data";
//    }
//    if (!mounted) return;
//    setState((){
//      _test = result;
//    });

    String dataURL = "https://gank.io/api/data/Android/10/1";
    http.Response response = await http.get(dataURL);
    debugPrint(response.statusCode.toString());
    setState(() {
      _test = response.body.toString();
    });
  }
}


