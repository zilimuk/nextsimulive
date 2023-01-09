// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simulive/configurations/api_client.dart';
import 'package:simulive/configurations/app_constants.dart';

class AuthRepository extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "NONE";
  }

  Future<Response> login(String username, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URL, {"username": username, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  // Future<bool> saveLoginResponseHeader(List<String> header) async {
  //   return await sharedPreferences.setStringList(
  //       AppConstants.RESPONSE_HEADER, header);
  // }

  bool userLoggedin() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<List<String?>> getUsernameAndPassword() async {
    String? _username = sharedPreferences.getString(AppConstants.USERNAME);
    String? _password = sharedPreferences.getString(AppConstants.PASSWORD);

    return [_username, _password];
  }

  Future<List<String>> saveUsernameAndPassword(
      String username, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USERNAME, username);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);

      return [username, password];
    } catch (e) {
      rethrow;
    }
  }
}
