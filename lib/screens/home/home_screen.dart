import 'package:flutter/material.dart';
import 'package:youthopportunities/screens/home/categories/category-widget.dart';
import 'package:youthopportunities/screens/home/opportunities/opportunity-home-widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Categories(),
              OpportunitiesHomeWidget(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("Drawer Content"),
        ),
      ),
    );
  }
}
