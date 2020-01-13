import 'package:flutter/material.dart';
import 'package:my_trip/demo/page_view.dart';
import 'package:my_trip/routes/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: TabRoute(),
      routes: <String, WidgetBuilder>{
        "pageViewDemo": (context) => PageViewRoute(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _navigatorButton(context, "PageView demo", "pageViewDemo"),
          ],
        ),
      ),
    );
  }

  Widget _navigatorButton(BuildContext context, String name, String route) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(name),
    );
  }
}
