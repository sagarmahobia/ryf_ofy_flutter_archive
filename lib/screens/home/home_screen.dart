import 'package:flutter/material.dart';
import 'package:youthopportunities/screens/home/categories/category-widget.dart';
import 'package:youthopportunities/screens/home/opportunities/opportunity-home-widget.dart';

class MyHomePage extends StatelessWidget {
  var title;

  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search)),
        ],
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
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
