import 'dart:async';

import 'package:youthopportunities/data/categories/categories-dto.dart';
import 'package:youthopportunities/services/categories-service.dart';
import 'package:youthopportunities/utilitities/response-model.dart';

class CategoryWidgetViewModel {
  // ignore: close_sinks
  StreamController<Response> _streamController;

  StreamController get controller => _streamController;

  Stream get stream => _streamController.stream;

  CategoryWidgetViewModel() {
    _streamController = new StreamController<Response>();
    _streamController.add(Response.loading());
    this.load();
  }

  void load() {
    _streamController.add(Response.loading());
    fetchCategories().then(
        (value) => {
              _streamController.add(Response.success<CategoriesDTO>(value)),
            },
        onError: (error) => {_streamController.add(Response.exception(error))});
  }

  void dispose() {
    _streamController.close();
  }
}
