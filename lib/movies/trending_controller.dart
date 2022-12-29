import 'dart:convert';

import 'package:simulive/configurations/http_request.dart';
import 'package:http/http.dart' as http;
import 'package:simulive/movies/model/movie.dart';

Future<Movie> fetchTrendingVideo() async {
  final response =
      await http.get(Uri.parse(HttpRequest.trendingVideos(1, 25, 1)));
  if (response.statusCode == 200) {
    return Movie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}
