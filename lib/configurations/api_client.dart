// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';
import 'package:simulive/configurations/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String? token;
  late String phpid;
  late String sesssalt;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;

    token = AppConstants.TOKEN;
    phpid = AppConstants.PHPID;
    sesssalt = AppConstants.SESSSALT;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'access-control-allow-origin': '*',
      'Authorization': 'Bearer $token',
      'Cookie': 'phpid=$phpid;sesssalt=$sesssalt',
    };
  }
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void updateHeader(String token, String phpid, String sesssalt) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'access-control-allow-origin': '*',
      'Authorization': 'Bearer $token',
      'Cookie': 'phpid=$phpid;sesssalt=$sesssalt',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // Future<Response> getVideos(String uri,)
}
