// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        title: Text(
          "Favourite News",
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Center(
        child: Text(
          "Favourite News are Empty I couldn't do it",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
