import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youthopportunities/data/categories/categories-dto.dart';

Future<CategoriesDTO> fetchCategories() async {
  final response =
  await http.get('http://ofy.co.in/api/v1/public/categories');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var result = json.decode(response.body);

    return CategoriesDTO.fromJson(result);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
