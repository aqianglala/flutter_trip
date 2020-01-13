import 'package:flutter/material.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加
    return Container(
      child: Text("search"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
