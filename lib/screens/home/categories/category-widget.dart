import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youthopportunities/components/category-card-components.dart';
import 'package:youthopportunities/data/categories/categories-dto.dart';
import 'package:youthopportunities/screens/home/categories/category-widget-viewmodel.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  CategoryWidgetViewModel viewModel;

  Categories() {
    viewModel = new CategoryWidgetViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: StreamBuilder<Response>(
        stream: viewModel.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text("LOading");
          }

          if (snapshot.data.status == Status.SUCCESS) {
            return Center(
              child: Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: _getListData(snapshot.data.data),
                  ).toList(),
                ),
              ),
            );
          } else if (snapshot.data.status == Status.ERROR) {
            return Center(
              child: Text(
                "ERROR",
                style: TextStyle(fontSize: 12),
              ),
            );
          } else if (snapshot.data.status == Status.LOADING) {
            return Center(
              child: Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
            );
          }
          return Center(
            child: Text("Loading"),
          );
        },
      ),
    );
  }
}

Iterable<Widget> _getListData(CategoriesDTO categoriesDTO) {
  List<Widget> widgets = new List<Widget>();
  List<Category> categories = categoriesDTO.categories;
  for (var value in categories) {
    widgets.add(getCategoryCard(value));
  }
  return widgets;
}
