import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simulive/configurations/http_request.dart';
import 'package:simulive/movies/model/movie.dart';
import 'package:simulive/movies/model/video_streaming.dart';

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

Future<VideoStreaming> fetchVideoLink(String videoid) async {
  String token =
      "Bear eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NzI2NjY1NTgsImV4cCI6MTcwNDIwMjU1OCwianRpIjoiM0FEbFZPSE9ud0p6R0RKQjE5bURlSiIsInNlc3MiOiJ2aGczbW82NDFwODdycGpwMjRuczExY2EwNyIsImtleSI6Ijc3Nzc1MGZlYTRkM2JkNTg1YmY0N2RjMTg3MzYxOWZjIiwic2FsdCI6IjJhZmZlNTZmIiwic2NvcGUiOlsiYWRtaW5fYWNjZXNzIiwibGljZW5zZV9tYW5hZ2VtZW50X2FjY2VzcyIsInN0YXRzX3JlcG9ydF9hY2Nlc3MiLCJtYXJrZXRpbmdfYWNjZXNzIiwicmV2ZW51ZV9tYW5hZ2VtZW50X2FjY2VzcyIsInVzZXJfbWFuYWdlbWVudF9hY2Nlc3MiLCJjb250ZW50X21hbmFnZW1lbnRfYWNjZXNzIiwiYWxsb3dfdmlkZW9fdXBsb2FkIiwidmlld192aWRlbyIsInZpZXdfY2hhbm5lbCIsInZpZXdfZ3JvdXAiLCJ2aWV3X3ZpZGVvcyIsImF2YXRhcl91cGxvYWQiLCJ2aWRlb19tb2RlcmF0aW9uIiwibWVtYmVyX21vZGVyYXRpb24iLCJhZF9tYW5hZ2VyX2FjY2VzcyIsIm1hbmFnZV90ZW1wbGF0ZV9hY2Nlc3MiLCJncm91cF9tb2RlcmF0aW9uIiwid2ViX2NvbmZpZ19hY2Nlc3MiLCJzdGF0c19kYXNoIiwidmlld19jaGFubmVscyIsInZpZXdfZ3JvdXBzIiwicGxheWxpc3RfYWNjZXNzIiwiYWxsb3dfY2hhbm5lbF9iZyIsInByaXZhdGVfbXNnX2FjY2VzcyIsImVkaXRfdmlkZW8iLCJkb3dubG9hZF92aWRlbyIsImFkbWluX2RlbF9hY2Nlc3MiLCJwaG90b3NfbW9kZXJhdGlvbiIsInNlcmllc19tb2RlcmF0aW9uIiwicGx1Z2luc19tb2RlcmF0aW9uIiwidG9vbF9ib3giLCJhbGxvd19tYW5hZ2VfdXNlcl9sZXZlbCIsImFsbG93X2NyZWF0ZV9jb2xsZWN0aW9uIiwiYWxsb3dfY3JlYXRlX3BsYXlsaXN0IiwiYWxsb3dfbWFrZV9wcmVtaXVtIiwiY3VzdG9taXplX3Njc3MiLCJjaGFuZ2VfY29uZmlnX2F1dG9sb2FkIiwibWFuYWdlX2NvdXBvbnMiLCJhbGxvd19mcmVlX3BsYXliYWNrIiwiYWxsb3dfc3Vic2NyaXB0aW9uX21hbmFnZW1lbnQiXSwic3ViIjp7ImNhdGVnb3J5Ijo0LCJjb3VudHJ5IjoiVFoiLCJkb2IiOiIwMDAwLTAwLTAwIiwiZW1haWwiOiJzaW11bGl2ZWFwcEBnbWFpbC5jb20iLCJsZXZlbCI6MSwic2V4IjoiZmVtYWxlIiwidXNlcmlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwid2VsY29tZV9lbWFpbF9zZW50IjoieWVzIiwiaXNfYmFubmVkIjpmYWxzZSwiaXNfYWN0aXZlIjp0cnVlfX0.juYk_qOtb7vKQNLVVppNlDDu6jNlIFPPdPGtqZxJHQ0";

  final response =
      await http.get(Uri.parse(HttpRequest.streamVideoUrl(videoid, token)));
  print(jsonDecode(response.body));
  if (response.statusCode == 0) {
    return VideoStreaming.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}
