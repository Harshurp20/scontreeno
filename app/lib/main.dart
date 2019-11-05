import 'package:flutter/material.dart';
import 'package:scontreeno/pages_app/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SconTreeNo',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
