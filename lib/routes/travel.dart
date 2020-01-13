import 'package:flutter/material.dart';

class TravelRoute extends StatefulWidget {
  @override
  _TravelRouteState createState() => _TravelRouteState();
}

class _TravelRouteState extends State<TravelRoute>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加
    return Container(
      child: Text("travel"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
