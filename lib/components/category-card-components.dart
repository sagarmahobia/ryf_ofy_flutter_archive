import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopportunities/data/categories/categories-dto.dart';

Widget getCategoryCard(Category category) {
  return Stack(
    children: <Widget>[
      Container(
        height: 90,
        width: 70,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              fit: BoxFit.cover,
              height: 150,
              width: 100,
              image: NetworkImage("http://ofy.co.in/api/v1/" + category.image),
            ),
          ),
        ),
      ),
      Container(
        width: 70,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              category.title,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
