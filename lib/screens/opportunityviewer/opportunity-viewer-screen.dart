import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youthopportunities/data/opportunities/opportunity-viewer-dto.dart';
import 'package:youthopportunities/screens/opportunityviewer/opportunity-viewer-viewmodel.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

class OpportunityViewerScreen extends StatelessWidget {
  final int _id;

  OpportunityViewerWidgetViewModel viewModel;

  OpportunityViewerScreen(this._id) {
    viewModel = OpportunityViewerWidgetViewModel(_id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<Response>(
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
              return getTabView(snapshot.data.data);
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
        ),
      ),
    );
  }

  Widget getTabView(OpportunityViewerDTO data) {
    ScrollController controller = ScrollController();

    List<TabWrapper> list = new List<TabWrapper>();

    if (data.description != null && data.description.trim().isNotEmpty) {
      list.add(new TabWrapper("Description", data.description));
    }
    if (data.benefit != null && data.benefit.trim().isNotEmpty) {
      list.add(new TabWrapper("Benefit", data.benefit));
    }
    if (data.eligibility != null && data.eligibility.trim().isNotEmpty) {
      list.add(new TabWrapper("Eligibility", data.eligibility));
    }
    if (data.applicationProcess != null &&
        data.applicationProcess.trim().isNotEmpty) {
      list.add(new TabWrapper("Process", data.applicationProcess));
    }
    if (data.other != null && data.other.trim().isNotEmpty) {
      list.add(new TabWrapper("Other", data.other));
    }

    List<Tab> tabs = new List<Tab>();

    for (TabWrapper tb in list) {
      tabs.add(Tab(text: tb.title));
    }
    List<Widget> tabbars = new List<Widget>();

    for (TabWrapper tb in list) {
      tabbars.add(
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(data: tb.content),
          ),
        ),
      );
    }
    return DefaultTabController(
      length: list.length,
      child: NestedScrollView(
        controller: controller,

        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 180,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(data.image),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TabBar(
              isScrollable: true,
              tabs: tabs,
            ),
            Expanded(
              child: TabBarView(
                children: tabbars,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabWrapper {
  String _content;
  String _title;

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  TabWrapper(this._title, this._content);

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
