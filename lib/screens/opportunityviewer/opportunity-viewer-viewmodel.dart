import 'dart:async';

import 'package:youthopportunities/data/opportunities/opportunity-viewer-dto.dart';
import 'package:youthopportunities/services/categories-service.dart';
import 'package:youthopportunities/services/opportunity-service.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

class OpportunityViewerWidgetViewModel {
  // ignore: close_sinks
  StreamController<Response> _streamController;

  int id;

  StreamController get controller => _streamController;

  Stream get stream => _streamController.stream;

  OpportunityViewerWidgetViewModel(this.id) {
    _streamController = new StreamController<Response>();
    _streamController.add(Response.loading());
    this.load();
  }

  void load() {
    _streamController.add(Response.loading());
    fetchOpportunityDetail(id).then(
        (value) => {
              _streamController
                  .add(Response.success<OpportunityViewerDTO>(value)),
            },
        onError: (error) => {_streamController.add(Response.exception(error))});
  }

  void dispose() {
    _streamController.close();
  }
}
