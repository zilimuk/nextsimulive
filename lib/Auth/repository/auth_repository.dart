// ignore_for_file: no_leading_underscores_for_local_identifiers, await_only_futures

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
    return await sharedPreferences.getString("TOKEN") ?? "NONE";
  }

  Future<String> getCookiePhpId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("PHPID") ?? "NONE";
    // return await sharedPreferences.getString(AppConstants.RESPONSE_HEADER);
  }

  Future<String> getCookieSesssalt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("SESSSALT") ?? "NONE";
    // return await sharedPreferences.getString(AppConstants.RESPONSE_HEADER);
  }

  Future<Response> login(String username, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URL, {"username": username, "password": password});
  }

  Future<bool> saveUserToken(
      String token, String phpid, String sesssalt) async {
    apiClient.token = token;
    apiClient.updateHeader(token, phpid, sesssalt);
    return await sharedPreferences.setString("TOKEN", token);
  }

  Future<String> saveCookie(String phpid, String sesssalt) async {
    sharedPreferences.setString("PHPID", phpid);
    sharedPreferences.setString("SESSSALT", sesssalt);
    return '$phpid$sesssalt';
  }

  bool userLoggedin() {
    return sharedPreferences.containsKey("TOKEN");
  }

  Future<List<String?>> getUsernameAndPassword() async {
    String? _username = sharedPreferences.getString("USERNAME");
    String? _password = sharedPreferences.getString("PASSWORD");

    return [_username, _password];
  }

  Future<String> saveUsernameAndPassword(
      String username, String password) async {
    try {
      await sharedPreferences.setString("USERNAME", username);
      await sharedPreferences.setString("PASSWORD", password);

      return username;
    } catch (e) {
      rethrow;
    }
  }
}
