import 'package:get/get.dart';
import 'package:simulive/configurations/api_client.dart';
import 'package:simulive/configurations/app_constants.dart';

class MovieRepository extends GetxService {
  final ApiClient apiClient;

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

    return await apiClient.get(AppConstants.MOVIES + pagination);
  }
}
