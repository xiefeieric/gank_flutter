import 'package:flutter/material.dart';
import 'android_view.dart';
import 'ios_view.dart';
import 'hot_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gank-Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
//      routes: <String, WidgetBuilder>{
//        '/today': (context) => Today(),
//        '/android': (context) => Android()
//      },
      home: Scaffold(
          appBar: AppBar(
            title: Text("Gank"),
          ),
//          drawer: Drawer(
//            child: ListView(
//              children: <Widget>[
//                DrawerHeader(
//                    margin: const EdgeInsets.only(bottom: 8.0),
//                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
//                    child: Center(
//                      child: Text(
//                        "Gank",
//                        style: TextStyle(fontSize: 24.0),
//                      ),
//                    )),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('Today'),
//                  selected: true,
//                  onTap: () {
//                    // change app state...
//                    debugPrint("show today page");
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(builder: (context) => Today()));
////                  Navigator.pop(context); // close the drawer
//                  },
//                ),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('Android'),
//                  onTap: () {
//                    // change app state...
//                    Navigator.pop(context);
////                    Navigator.push(context, MaterialPageRoute(builder: (context) => Android()));
//                    debugPrint("show adnroid page");
//
////                  Navigator.of(context).pop(); // close the drawer
//                  },
//                ),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('iOS'),
//                  onTap: () {
//                    // change app state...
//                    debugPrint("show iOS page");
////                  Navigator.of(context).pop(); // close the drawer
//                  },
//                ),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('前端'),
//                  onTap: () {
//                    // change app state...
//                    debugPrint("show front end page");
////                  Navigator.of(context).pop(); // close the drawer
//                  },
//                ),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('福利'),
//                  onTap: () {
//                    // change app state...
//                    debugPrint("show benefit page");
////                  Navigator.of(context).pop(); // close the drawer
//                  },
//                ),
//                ListTile(
//                  leading: new Icon(Icons.change_history),
//                  title: new Text('休息视频'),
//                  onTap: () {
//                    // change app state...
//                    debugPrint("show video page");
////                  Navigator.of(context).pop(); // close the drawer
//                  },
//                ),
//                const Divider(
//                  color: Colors.grey,
//                )
//              ],
//            ),
//          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index) {
              debugPrint(index.toString());
              setState(() {
                _index = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.android),
                title: Text("Android"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_system_daydream),
                title: Text("iOS"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                title: Text("Hot"),
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              Offstage(
                offstage: _index != 0,
                child: TickerMode(
                  enabled: _index == 0,
                  child: MaterialApp(home: Android()),
                ),
              ),
              Offstage(
                offstage: _index != 1,
                child: TickerMode(
                  enabled: _index == 1,
                  child: MaterialApp(home: IOS()),
                ),
              ),
              Offstage(
                offstage: _index != 2,
                child: TickerMode(
                  enabled: _index == 2,
                  child: MaterialApp(home: Hot()),
                ),
              ),
            ],
          )),
    );
  }
}






