import 'package:flutter/material.dart';
import 'package:youthopportunities/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ofy',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(  'ofy'),
    );
  }
}
