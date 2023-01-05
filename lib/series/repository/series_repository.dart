import 'package:get/get.dart';
import 'package:simulive/configurations/api_client.dart';
import 'package:simulive/configurations/app_constants.dart';
import 'package:simulive/helper/pagination_query.dart';

class SeriesRepository {
  final ApiClient apiClient;

  String? validateCategories;

  SeriesRepository({required this.apiClient});

  Future<Response> getSeriesList(int categories, paginate, limit, page) async {
    return await apiClient.getData(AppConstants.SERIES +
        PaginationQuery.pagination(categories, paginate, limit, page));
  }
}
