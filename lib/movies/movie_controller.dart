import 'package:get/get.dart';
import 'package:simulive/helper/response_model.dart';
import 'package:simulive/movies/model/movie.dart';
import 'package:simulive/movies/repository/movie_repository.dart';

class MovieContoller extends GetxController implements GetxService {
  final MovieRepository movieRepository;
  Movie? _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Movie? get movies => _movies;

  MovieContoller({required this.movieRepository});

  Future<ResponseModel> fetchMovies(
      int categories, paginate, limit, page) async {
    _isLoading = true;
    Response response =
        await movieRepository.getVideoList(categories, paginate, limit, page);

    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _movies = Movie.fromJson(response.body);
      return responseModel =
          ResponseModel(true, "Movies retrieved successfully");
    } else {
      _isLoading = false;
      return responseModel = ResponseModel(false, response.statusText!);
    }
  }
}
