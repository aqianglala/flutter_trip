import 'package:flutter/material.dart';

class MyRoute extends StatefulWidget {
  @override
  _MyRouteState createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加
    return Container(
      child: Text("my"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
