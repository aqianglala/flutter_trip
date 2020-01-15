import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_trip/dao/home_dao.dart';
import 'package:my_trip/models/common.dart';
import 'package:my_trip/models/gridNav.dart';
import 'package:my_trip/models/home.dart';
import 'package:my_trip/models/salesBox.dart';
import 'package:my_trip/widget/grid_nav.dart';
import 'package:my_trip/widget/local_nav.dart';
import 'package:my_trip/widget/sales_box.dart';
import 'package:my_trip/widget/sub_nav.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>
    with AutomaticKeepAliveClientMixin {
  static const double APP_BAR_HEIGHT = 100.0;
  double _appBarAlpha = 0;

  List<Common> _bannerList = [];
  List<Common> _localNavList = [];
  List<Common> _subNavList = [];
  GridNav _gridNav;

  SalesBox _salesBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification &&
                      notification.depth == 0) {
                    _onScroll(notification.metrics.pixels);
                  }
                  return false;
                },
                child: ListView(
                  children: <Widget>[
                    _banner,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                      child: LocalNav(
                        localNavList: _localNavList,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                      child: GridNavWidget(
                        gridNavModel: _gridNav,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                      child: SubNav(
                        subNavList: _subNavList,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                      child: SaleBox(
                        salesBox: _salesBox,
                      ),
                    )
                  ],
                ),
              )),
          Opacity(
            opacity: _appBarAlpha,
            child: Container(
              height: 80,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onScroll(double offset) {
    double alpha = offset / APP_BAR_HEIGHT;
    if (alpha < 0) {
      alpha = 0;
    }
    if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  bool get wantKeepAlive => true;

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: new Image.network(
              _bannerList[index].icon,
              fit: BoxFit.fill,
            ),
            onTap: () {},
          );
        },
        itemCount: _bannerList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  void _refresh() async {
    try {
      Home homeModel = await HomeDao.fetch();
      setState(() {
        _bannerList = homeModel.bannerList;
        _localNavList = homeModel.localNavList;
        _gridNav = homeModel.gridNav;
        _subNavList = homeModel.subNavList;
        _salesBox = homeModel.salesBox;
      });
    } catch (e) {
      print(e);
      setState(() {});
    }
  }
}
