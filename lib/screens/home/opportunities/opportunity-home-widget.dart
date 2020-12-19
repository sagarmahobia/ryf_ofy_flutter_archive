import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:youthopportunities/components/opportunity-card-components.dart';
import 'package:youthopportunities/data/opportunities/opportunity-dto.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

import 'opportunity-home-widget-viewmodel.dart';

class OpportunitiesHomeWidget extends StatelessWidget {
  OpportunityHomeWidgetViewModel viewModel;

  OpportunitiesHomeWidget() {
    viewModel = OpportunityHomeWidgetViewModel();
  }

  @override
  Widget build(BuildContext _context) {
    return StreamBuilder<Response>(
      stream: viewModel.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
          );
        }
        if (snapshot.data.status == Status.SUCCESS) {
          return Column(
            children:
                _getWidgetList(snapshot.data.data.opportunitiesList, _context),
          );
        } else if (snapshot.data.status == Status.LOADING) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
          );
        } else if (snapshot.data.status == Status.ERROR) {
          return Center(child: Text("Something went wrong"));
        }
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          )),
        );
      },
    );
  }

  List<Widget> _getWidgetList(
      List<OpportunitiesDTO> opportunitiesList, BuildContext context) {
    List<Widget> widgets = [];

    for (OpportunitiesDTO value in opportunitiesList) {
      if (value.opportunitiesDTO == null ||
          value.opportunitiesDTO.length == 0) {
        continue;
      }

      var list = ListTile.divideTiles(
              context: context,
              tiles: _getListData(value.opportunitiesDTO, context))
          .toList();

      widgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      value.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SEE MORE",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
            Container(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list,
              ),
            ),
          ],
        ),
      ));
    }
    return widgets;
  }

  List<Widget> _getListData(
      List<OpportunityDTO> opportunitiesDTO, BuildContext context) {
    List<Widget> widgets = [];

    for (var value in opportunitiesDTO) {
      widgets.add(
        GestureDetector(
          child: getOpportunityCard(value, context),
        ),
      );
    }
    return widgets;
  }
}
