import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youthopportunities/data/opportunities/opportunity-dto.dart';
import 'package:youthopportunities/data/opportunities/opportunity-viewer-dto.dart';

Future<HomeOpportunitiesDTO> fetchOpportunities() async {
  final response =
      await http.get('http://ofy.co.in/api/v1/public/opportunities');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var result = json.decode(response.body);
    print(result); //todo
    return HomeOpportunitiesDTO.fromJson(result);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<OpportunityViewerDTO> fetchOpportunityDetail(int id) async {
  final response =
      await http.get('http://ofy.co.in/api/v1/public/opportunity?id=$id');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var result = json.decode(response.body);
    print(result); //todo
    return OpportunityViewerDTO.fromJson(result);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
