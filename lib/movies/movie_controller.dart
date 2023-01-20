// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:get/get.dart';
import 'package:simulive/helper/response_model.dart';
import 'package:simulive/movies/model/category_videos.dart';
import 'package:simulive/movies/model/movie.dart';
import 'package:simulive/movies/model/trending_video.dart';
import 'package:simulive/movies/model/video_category.dart';
import 'package:simulive/movies/model/video_featured.dart';
import 'package:simulive/movies/model/video_mylist.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:simulive/movies/repository/movie_repository.dart';

class MovieContoller extends GetxController implements GetxService {
  final MovieRepository movieRepository;
  Movie? _movies;
  CategoryVideos? _videoByCatories;
  VideoMyList? _videoMyList;
  FeaturedVideo? _featuredVideo;
  TrendingVideo? _trendingVideo;
  VideoCategories? _videoCategories;
  final _moviesInCategory = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Movie? get movies => _movies;
  CategoryVideos? get movieByCategory => _videoByCatories;
  VideoMyList? get videoMyList => _videoMyList;
  FeaturedVideo? get featuredVideo => _featuredVideo;
  TrendingVideo? get trendingVideo => _trendingVideo;
  VideoCategories? get videoCategories => _videoCategories;
  get moviesInCategory => _moviesInCategory;

  MovieContoller({required this.movieRepository});

// Fetch all videos movies + episodes
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

// Get all video from myList
  Future<ResponseModel> getMylistMovie(
      int categories, paginate, limit, page) async {
    _isLoading = true;
    update();
    Response response =
        await movieRepository.getMylistMovie(categories, paginate, limit, page);

    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _videoMyList = VideoMyList.fromJson(response.body);
      update();
      return responseModel =
          ResponseModel(true, "My List retrieved successfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }

//Get all featured Movie
  Future<ResponseModel> getFeaturedMovie(int paginate, limit, page) async {
    _isLoading = true;
    update();
    Response response =
        await movieRepository.getFeaturedMovie(paginate, limit, page);

    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _featuredVideo = FeaturedVideo.fromJson(response.body);
      update();
      return responseModel =
          ResponseModel(true, "Featured List retreived succussfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }

//Get all Trending Movie
  Future<ResponseModel> getTrendingMovie(int paginate, limit, page) async {
    _isLoading = true;
    update();

    Response response =
        await movieRepository.getTrendingMovie(paginate, limit, page);
    final ResponseModel responseModel;
    if (response.statusCode == 200) {
      _trendingVideo = TrendingVideo.fromJson(response.body);
      update();
      return responseModel =
          ResponseModel(true, "Trending video retrieved successfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }

//Get  categories
  Future<ResponseModel> getCategory() async {
    _isLoading = true;
    update();
    final ResponseModel responseModel;
    Response response = await movieRepository.getCategory();

    if (response.statusCode == 200) {
      _videoCategories = VideoCategories.fromJson(response.body);

      for (var i = 0; i < _videoCategories!.categories!.length; i++) {
        if (_videoCategories!.categories![i].navbar == "yes") {
          try {
            var vcat = await getVideoByCategory(
                _videoCategories!.categories![i].categoryId!.toInt(), 1, 25, 1);
            moviesInCategory.add({
              'category': _videoCategories!.categories![i].categoryName,
              'movies': _videoByCatories!.data
            });
          } catch (e) {
            // print(e);
          }
        }
      }
      update();
      return responseModel =
          ResponseModel(true, "Categories retrieved successfully");
    } else {
      _isLoading = false;
      update();
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }

  //Get videos by Category
  Future<ResponseModel> getVideoByCategory(
      int categories, paginate, limit, page) async {
    final ResponseModel responseModel;
    Response response = await movieRepository.getVideoByCategory(
        categories, paginate, limit, page);
    if (response.statusCode == 200) {
      Map<String, dynamic> _mCategory = response.body;
      _mCategory = _mCategory['videos']['category_videos']['$categories'];
      // _mCategory = _mCategory['$categories'];
      // print(_mCategory['currentPage']);
      // return _videoByCatories = CategoryVideos.fromJson(_mCategory);
      // print("videos");
      _videoByCatories = CategoryVideos.fromJson(_mCategory);

      return responseModel = ResponseModel(true, "Video fetched successfully");
    } else {
      return responseModel = ResponseModel(false, response.statusText!);
      // return CategoryVideos.fromJson(response.body);
    }
  }

//Fetch movie streaming URL
  Future<VideoStreaming> fetchMoviePlayUrl(String videoId) async {
    _isLoading = true;
    update();
    final VideoStreaming _videoStreaming;
    Response response = await movieRepository.getMovieUrl(videoId);

    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _videoStreaming = VideoStreaming.fromJson(response.body);

      update();

      return _videoStreaming;
    } else {
      return _videoStreaming = VideoStreaming.fromJson(response.body);
    }
  }
}
