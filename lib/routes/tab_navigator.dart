import 'package:flutter/material.dart';
import 'package:my_trip/routes/home.dart';
import 'package:my_trip/routes/my.dart';
import 'package:my_trip/routes/search.dart';
import 'package:my_trip/routes/travel.dart';

class TabRoute extends StatefulWidget {
  @override
  _TabRouteState createState() => _TabRouteState();
}

class _TabRouteState extends State<TabRoute> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomeRoute(),
          SearchRoute(),
          TravelRoute(),
          MyRoute()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _item("首页", Icons.home),
          _item("搜索", Icons.search),
          _item("旅拍", Icons.camera_alt),
          _item("我的", Icons.account_circle),
        ],
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _item(String title, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
    );
  }
}
