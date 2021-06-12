import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppBrowser {
  static Future<void> load(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        // forceSafariVC: false,
        // forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AppWebView extends StatelessWidget {
  final String url;
  final String title;
  const AppWebView({Key key, this.url, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: title,
        isLocalised: false,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
