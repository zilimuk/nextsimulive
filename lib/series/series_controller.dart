import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simulive/configurations/http_request.dart';
import 'package:simulive/series/model/series.dart';

Future<SeriesList> fetchSeries() async {
  final response =
      await http.get(Uri.parse(HttpRequest.seriesUrl(0, 1, 15, 1)));

  if (response.statusCode == 200) {
    return SeriesList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load series');
  }
}
