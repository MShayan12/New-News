// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.ac_unit)),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Shayan",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "News App",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
