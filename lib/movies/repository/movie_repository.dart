// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simulive/Auth/auth_controller.dart';
import 'package:simulive/configurations/api_client.dart';
import 'package:simulive/configurations/app_constants.dart';

class MovieRepository extends GetxService {
  final ApiClient apiClient;
  late SharedPreferences sharedPreferences;
  late AuthController authController;
  String? validateCategories;

  MovieRepository({required this.apiClient});

  Future<Response> getVideoList(
      int categories, int paginate, int limit, int page) async {
    //check if you it is all categories "O" represents all Categories
    if (categories == 0) {
      validateCategories = 'categories';
    } else {
      // ignore: prefer_interpolation_to_compose_strings
      validateCategories = 'categories=' + categories.toString();
    }
    // ignore: prefer_interpolation_to_compose_strings
    String pagination = validateCategories! +
        "&" +
        "paginate=" +
        paginate.toString() +
        "&" +
        "limit=" +
        limit.toString() +
        "&" +
        "page=" +
        page.toString();

    return await apiClient.getData(AppConstants.MOVIES + pagination);
  }

  Future<Response> getMovieUrl(String videoId) async {
    var _tok = await Get.find<AuthController>().getToken();
    String _token = _tok;
    var _php = await Get.find<AuthController>().getCookiePhpId();
    String _phpid = _php.toString();
    var _sess = await Get.find<AuthController>().getCookieSesssalt();
    String _sesssalt = _sess.toString();

    apiClient.updateHeader(_token, _phpid, _sesssalt);
    return await apiClient
        .postData("${AppConstants.VIDEO}$videoId/playable", {});
    // return await apiClient.postData(
    //     "${AppConstants.VIDEO}$videoId/playable", authController.getToken());
  }
}
