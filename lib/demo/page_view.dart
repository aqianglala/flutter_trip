import 'package:flutter/material.dart';

class PageViewRoute extends StatefulWidget {
  @override
  _PageViewRouteState createState() => _PageViewRouteState();
}

class _PageViewRouteState extends State<PageViewRoute> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("pageView demo"),
        ),
        body: Column(
          children: <Widget>[
            _defaultPageView(),
            _builderPageView(),
            RaisedButton(
              child: Text("jump to 1"),
              onPressed: () => _controller.jumpToPage(1),
            ),
          ],
        ));
  }

  Widget _defaultPageView() {
    return Expanded(
      child: PageView(
        controller: _controller,
        children: <Widget>[
          _item("text0"),
          _item("text1"),
          _item("text2"),
        ],
      ),
    );
  }

  Widget _builderPageView() {
    return Expanded(
      child: PageView.builder(
        itemBuilder: (context, index) {
          return _item('text$index');
        },
        itemCount: 5,
      ),
    );
  }

  Widget _item(String title) {
    return Center(
      child: Text(title),
    );
  }
}
