// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:get/get.dart';
import 'package:simulive/helper/response_model.dart';
import 'package:simulive/movies/model/movie.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:simulive/movies/repository/movie_repository.dart';

class MovieContoller extends GetxController implements GetxService {
  final MovieRepository movieRepository;
  Movie? _movies;
  VideoStreaming? _videoStreaming;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Movie? get movies => _movies;

  MovieContoller({required this.movieRepository});

  Future<ResponseModel> fetchMovies(
      int categories, paginate, limit, page) async {
    _isLoading = true;
    update();
    Response response =
        await movieRepository.getVideoList(categories, paginate, limit, page);

    // ignore: unused_local_variable
    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _movies = Movie.fromJson(response.body);
      update();
      return responseModel =
          ResponseModel(true, "Movies retrieved successfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }

  Future<VideoStreaming> fetchMoviePlayUrl(String videoId) async {
    _isLoading = true;
    update();
    final VideoStreaming _videoStreaming;
    Response response = await movieRepository.getMovieUrl(videoId);

    // ignore: unused_local_variable
    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      _videoStreaming = VideoStreaming.fromJson(response.body);
      print(_videoStreaming);
      update();

      return _videoStreaming;
      // } else {
      //   _isLoading = false;
      //   update();
      //   responseModel = ResponseModel(false, response.statusText!);
      //   return response.status;
    } else {
      return _videoStreaming = VideoStreaming.fromJson(response.body);
    }
  }
}
