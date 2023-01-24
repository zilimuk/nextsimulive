import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simulive/Auth/auth_controller.dart';
import 'package:simulive/Auth/repository/auth_repository.dart';
import 'package:simulive/configurations/api_client.dart';
import 'package:simulive/configurations/app_constants.dart';
import 'package:simulive/movies/movie_controller.dart';
import 'package:simulive/movies/repository/movie_repository.dart';
import 'package:simulive/series/repository/series_repository.dart';
import 'package:simulive/series/series_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() =>
      AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => MovieRepository(apiClient: Get.find()));
  Get.lazyPut(() => SeriesRepository(apiClient: Get.find()));
//Repository injection
  // Get.lazyPut(() => AuthRepository(ApiClient: Get.find()));

//Controllers
  Get.lazyPut(() => AuthController(authRepository: Get.find()));
  Get.lazyPut(() => MovieController(movieRepository: Get.find()));
  Get.lazyPut(() => SeriesController(seriesRepository: Get.find()));
}
