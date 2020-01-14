import 'package:flutter/material.dart';
import 'package:my_trip/models/common.dart';
import 'package:my_trip/models/gridNav.dart';
import 'package:my_trip/models/gridNavItem.dart';

class GridNavWidget extends StatelessWidget {
  final GridNav gridNavModel;

  const GridNavWidget({Key key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    if (gridNavModel == null) return null;
    List<Widget> items = [];
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
    items.add(_mainItem(context, gridNavItem));
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
        children: items,
      ),
    );
  }

  Widget _mainItem(BuildContext context, GridNavItem gridNavItem) {}

  Widget _doubleItems(BuildContext context, Common item1, Common item2) {}
}
