import 'package:appnew/Widgets/SmartCodeTitle.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleScreen extends StatefulWidget {
   static String id='ArticleScreen';
   String url;
   ArticleScreen({this.url});
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SmartCodeTitle(),
      ),
    body: WebView(
  initialUrl: widget.url,
),
    );
  }
}
