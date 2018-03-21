import 'package:flutter/material.dart';
import 'package:gank_flutter/model_item.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import "dart:convert";

class Android extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AndroidState();
  }
}

class AndroidState extends State<Android> {
  List<ModelItem> _items;

  @override
  void initState() {
    super.initState();
    _items = [];
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: getListView());
  }

  Widget getRow(int position) {
    return new GestureDetector(
      child: new Padding(
        padding: new EdgeInsets.all(6.0),
        child: new ListTile(
          title: new Text(
            _items[position].desc,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        debugPrint(_items[position].url);
      },
    );
  }

  loadData() async {
    String dataURL = "https://gank.io/api/data/Android/20/1";
    http.Response response = await http.get(dataURL);
    setState(() {
      debugPrint(response.statusCode.toString());
      Map data = JSON.decode(response.body);
      for (var value in data['results']) {
        ModelItem item = new ModelItem();
        item.mapFromObj(value);
        _items.add(item);
      }
    });
  }

  showLoadingDialog() {
    if (_items.length == 0) {
      return true;
    }

    return false;
  }

  getListView() {
    return new Stack(
      children: <Widget>[
        new ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }),
        getBody()
      ],
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return new Center(
        child: new CircularProgressIndicator()
      );
    } else {
      return new Text("");
    }
  }
}
