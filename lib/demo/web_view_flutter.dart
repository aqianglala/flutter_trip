import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  final String url;
  final bool showAppBar;
  final String appBarColor;

  const WebViewExample(
      {Key key, @required this.url, this.showAppBar = true, this.appBarColor})
      : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  WebViewController _controller;
  String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(),
        body: WillPopScope(
          child: SafeArea(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },

              /// 注册js channel，用于接收js 消息
//          javascriptChannels: <JavascriptChannel>[
//            _toasterJavascriptChannel(context),
//          ].toSet(),
              /// url 拦截
//          navigationDelegate: (NavigationRequest request) {
//            if (request.url.startsWith('https://www.youtube.com/')) {
//              print('blocking navigation to $request}');
//              return NavigationDecision.prevent;
//            }
//            print('allowing navigation to $request');
//            return NavigationDecision.navigate;
//          },
              /// 加载事件
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
                if (widget.showAppBar) {
                  _controller
                      .evaluateJavascript("document.title")
                      .then((result) {
                    setState(() {
                      _title = result;
                    });
                  });
                }
              },

              /// ios 滑动返回
              gestureNavigationEnabled: true,
            ),
          ),
          onWillPop: () async {
            if (_controller != null) {
              if (await _controller.canGoBack()) {
                await _controller.goBack();
              } else {
                return true;
              }
            }
            return false;
          },
        ));
  }

  _appbar() {
    String appBarColorStr = widget.appBarColor ?? "ffffff";
    Color appBarColor = Color(int.parse("0xff" + appBarColorStr));
    Color contentColor;
    if (appBarColorStr == 'ffffff') {
      contentColor = Colors.black;
    } else {
      contentColor = Colors.white;
    }
    return (widget.showAppBar ?? true)
        ? AppBar(
            backgroundColor: appBarColor,
            title: Text(
              _title ?? "",
              style: TextStyle(color: contentColor),
            ),
            iconTheme: IconThemeData(color: contentColor),
          )
        : null;
  }

  /// 接收js 消息
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  /// 调用js
  void _onShowUserAgent(
      WebViewController controller, BuildContext context) async {
    await controller.evaluateJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');
  }
}
