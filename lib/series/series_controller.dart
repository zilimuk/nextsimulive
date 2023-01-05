import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:simulive/configurations/http_request.dart';
import 'package:simulive/helper/response_model.dart';
import 'package:simulive/series/model/series.dart';
import 'package:simulive/series/repository/series_repository.dart';

class SeriesController extends GetxController implements GetxService {
  final SeriesRepository seriesRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  SeriesList? _seriesList;
  SeriesList? get seriesList => _seriesList;

  SeriesController({required this.seriesRepository});

  Future<ResponseModel> getSeriesList(
      int categories, paginate, limit, page) async {
    _isLoading = true;
    Response response =
        await seriesRepository.getSeriesList(categories, paginate, limit, page);
    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _seriesList = SeriesList.fromJson(response.body);

      return ResponseModel(true, "Series retrieved successfull");
    } else {
      _isLoading = false;
      return ResponseModel(false, response.statusText!);
    }
  }
}
