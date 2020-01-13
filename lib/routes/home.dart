import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>
    with AutomaticKeepAliveClientMixin {
  static const double APP_BAR_HEIGHT = 100.0;
  double _appBarAlpha = 0;

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
                    Container(
                      height: 800,
                      color: Colors.green,
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
              "http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg",
              fit: BoxFit.fill,
            ),
            onTap: () {},
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
