import 'package:get/get.dart';
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
    update();
    Response response =
        await seriesRepository.getSeriesList(categories, paginate, limit, page);
    // ignore: unused_local_variable
    final ResponseModel responseModel;

    if (response.statusCode == 200) {
      _seriesList = SeriesList.fromJson(response.body);
      update();
      return ResponseModel(true, "Series retrieved successfull");
    } else {
      _isLoading = false;
      update();
      return ResponseModel(false, response.statusText!);
    }
  }
}
