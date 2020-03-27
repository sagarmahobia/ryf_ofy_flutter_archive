import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopportunities/data/opportunities/opportunity-dto.dart';
import 'package:youthopportunities/screens/opportunityviewer/opportunity-viewer-widget.dart';

Widget getOpportunityCard(OpportunityDTO opportunity, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OpportunityViewerWidget(opportunity.id)),
      );
    },
    child: Container(
      width: 250,
      height: 230,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: <Widget>[
                  Image(
                    fit: BoxFit.cover,
                    height: 150,
                    width: 250,
                    image: NetworkImage(opportunity.image),
                  ),
                  Container(
                    // todo add gradient
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.center,
                          colors: [
                            Colors.black.withAlpha(200),
                            Colors.transparent
                          ]),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fully Funded",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "United States",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    child: Align(
                      alignment: FractionalOffset(1, 0.3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(200),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 6, 4, 6),
                          child: Text(
                            "20 Days Left",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Text(
                        opportunity.type,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      opportunity.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
