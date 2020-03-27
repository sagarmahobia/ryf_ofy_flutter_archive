import 'dart:async';

import 'package:youthopportunities/data/categories/categories-dto.dart';
import 'package:youthopportunities/data/opportunities/opportunity-dto.dart';
import 'package:youthopportunities/services/opportunity-service.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

class OpportunityHomeWidgetViewModel {
  StreamController<Response> _streamController;

  StreamController get controller => _streamController;

  Stream get stream => _streamController.stream;

  OpportunityHomeWidgetViewModel() {
    _streamController = new StreamController<Response>();
    _streamController.add(Response.loading());
    this.load();
  }

  void load() {
    _streamController.add(Response.loading());
    fetchOpportunities().then(
        (value) => {
              _streamController
                  .add(Response.success(value)),
            },
        onError: (error) => {_streamController.add(Response.exception(error))});
  }

  void dispose() {
    _streamController.close();
  }
}
