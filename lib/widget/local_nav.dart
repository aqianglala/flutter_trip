import 'package:flutter/material.dart';
import 'package:my_trip/models/common.dart';

class LocalNav extends StatelessWidget {
  final List<Common> localNavList;

  const LocalNav({Key key, this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavList == null) {
      return null;
    }
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
      children: items,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _item(BuildContext context, Common model) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            model.icon,
            width: 32,
            height: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
