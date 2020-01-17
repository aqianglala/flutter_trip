import 'package:flutter/material.dart';
import 'package:my_trip/models/common.dart';
import 'package:my_trip/models/gridNav.dart';
import 'package:my_trip/models/gridNavItem.dart';
import 'package:my_trip/util/navigator_util.dart';
import 'package:my_trip/widget/web_view.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNavModel;

  const GridNavWidget({Key key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }

  Widget _gridNavItem(
      BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItems(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItems(context, gridNavItem.item3, gridNavItem.item4));
    List<Widget> expandedItems = [];
    items.forEach((item) {
      expandedItems.add(Expanded(
        child: item,
      ));
    });

    Color startColor = Color(int.parse("0xff" + gridNavItem.startColor));
    Color endColor = Color(int.parse("0xff" + gridNavItem.endColor));
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandedItems,
      ),
    );
  }

  Widget _mainItem(BuildContext context, Common mainItem) {
    return _wrapGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Image.network(
              mainItem.icon,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                mainItem.title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
        mainItem);
  }

  Widget _doubleItems(BuildContext context, Common item1, Common item2) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, item1, true),
        ),
        Expanded(
          child: _item(context, item2, false),
        ),
      ],
    );
  }

  _item(BuildContext context, Common item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: _wrapGesture(context, Container(
        decoration: BoxDecoration(
            border: Border(
                left: borderSide,
                bottom: first ? borderSide : BorderSide.none)),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ), item)
    );
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
