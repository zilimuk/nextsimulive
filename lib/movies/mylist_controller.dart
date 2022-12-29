import 'dart:convert';

import 'package:simulive/configurations/http_request.dart';
import 'package:http/http.dart' as http;
import 'package:simulive/movies/model/movie.dart';

Future<Movie> fetchMyList() async {
  final response = await http.get(Uri.parse(HttpRequest.myListUrl(1, 5, 1)));
  if (response.statusCode == 200) {
    return Movie.fromJson(jsonDecode(response.body));
  } else {
    return jsonDecode(response.body);
  }
}
