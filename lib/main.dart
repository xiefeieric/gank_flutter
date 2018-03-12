import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gank-Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        '/today':(BuildContext context) => MyApp(),
        '/android':(BuildContext context) => Android()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gank"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Center(
                  child: Text(
                    "Gank",
                    style: TextStyle(
                        fontSize: 24.0
                    ),
                  ),
                )
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('Today'),
                selected: true,

                onTap: () {
                  // change app state...
                  debugPrint("show today page");
//                  Navigator.pop(context); // close the drawer
                },
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('Android'),
                onTap: () {
                  // change app state...
                  debugPrint("show adnroid page");


//                  Navigator.of(context).pop(); // close the drawer
                },
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('iOS'),
                onTap: () {
                  // change app state...
                  debugPrint("show iOS page");
//                  Navigator.of(context).pop(); // close the drawer
                },
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('前端'),
                onTap: () {
                  // change app state...
                  debugPrint("show front end page");
//                  Navigator.of(context).pop(); // close the drawer
                },
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('福利'),
                onTap: () {
                  // change app state...
                  debugPrint("show benefit page");
//                  Navigator.of(context).pop(); // close the drawer
                },
              ),
              ListTile(
                leading: new Icon(Icons.change_history),
                title: new Text('休息视频'),
                onTap: () {
                  // change app state...
                  debugPrint("show video page");
//                  Navigator.of(context).pop(); // close the drawer
                },
              ),
              const Divider(
                color: Colors.grey,
              )
            ],
          ),
        ),
        body: Today()
      ),
    );
  }
}

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("today"),
      ),
    );
  }
}

class Android extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Screen 2"),

      ),
      body: new Center(
        child: Text("android")
      ) ,
    );

  }
}
