import 'package:flutter/material.dart';
import 'package:my_trip/models/common.dart';
import 'package:my_trip/util/navigator_util.dart';
import 'package:my_trip/widget/web_view.dart';

class SubNav extends StatelessWidget {
  final List<Common> subNavList;

  const SubNav({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((item) {
      items.add(_item(context, item));
    });
    int firstLineCount = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, firstLineCount),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(firstLineCount),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context, Common item) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: item.url,
              statusBarColor: item.statusBarColor,
              hideAppBar: item.hideAppBar,
            ));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.icon,
            width: 18,
            height: 18,
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              item.title,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    ));
  }
}
