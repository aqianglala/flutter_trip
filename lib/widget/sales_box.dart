import 'package:flutter/material.dart';
import 'package:my_trip/models/common.dart';
import 'package:my_trip/models/salesBox.dart';
import 'package:my_trip/util/navigator_util.dart';
import 'package:my_trip/widget/web_view.dart';

class SaleBox extends StatelessWidget {
  final SalesBox salesBox;

  const SaleBox({Key key, this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    if (salesBox == null) return null;
    return Column(
      children: <Widget>[
        _title(context),
        _doubleItem(context, salesBox.bigCard1, salesBox.bigCard2, true, false),
        _doubleItem(
            context, salesBox.smallCard1, salesBox.smallCard2, false, false),
        _doubleItem(
            context, salesBox.smallCard3, salesBox.smallCard4, false, true),
      ],
    );
  }

  _title(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            salesBox.icon,
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(right: 7),
            padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffff4e63),
                  Color(0xffff6cc9),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                NavigatorUtil.push(
                  context,
                  WebView(url: salesBox.moreUrl, title: '更多活动'),
                );
              },
              child: Text(
                "获取更多福利 >",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }

  _doubleItem(
      BuildContext context, Common item1, Common item2, bool big, bool last) {
    return Row(
      children: <Widget>[
        _item(context, item1, big, true, last),
        _item(context, item2, big, false, last),
      ],
    );
  }

  _item(BuildContext context, Common item, bool big, bool left, bool last) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return _wrapGesture(
        context,
        Container(
          decoration: BoxDecoration(
              border: Border(
            right: left ? borderSide : BorderSide.none,
            bottom: last ? BorderSide.none : borderSide,
          )),
          child: Image.network(
            item.icon,
            width: (MediaQuery.of(context).size.width - 14 - 0.8) / 2,
            height: big ? 129 : 80,
          ),
        ),
        item);
  }

  _wrapGesture(BuildContext context, Widget widget, Common model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
              hideAppBar: model.hideAppBar,
            ));
      },
      child: widget,
    );
  }
}
