import 'package:flutter/material.dart';

class OpportunityViewerWidget extends StatelessWidget {
  final int _id;

  OpportunityViewerWidget(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opportuntity"),
      ),
    );
  }
}
