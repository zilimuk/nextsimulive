// ignore_for_file: avoid_print

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

  Future<ResponseModel> fetchMoviePlayUrl(String videoId) async {
    _isLoading = true;
    update();

    Response response = await movieRepository.getMovieUrl(videoId);

    // ignore: unused_local_variable
    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _videoStreaming = VideoStreaming.fromJson(response.body);
      print(_videoStreaming!.data![0].media![0].toString());
      return responseModel =
          ResponseModel(true, "Movies retrieved successfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }
}
