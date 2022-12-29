import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simulive/configurations/http_request.dart';
import 'package:simulive/movies/model/movie.dart';

Future<Movie> fetchMovie() async {
  final response = await http.get(Uri.parse(HttpRequest.movieUrl(0, 1, 25, 1)));

  if (response.statusCode == 200) {
    return Movie.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies');
  }
}
