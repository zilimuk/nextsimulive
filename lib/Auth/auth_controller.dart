import 'dart:convert';

import 'package:get/get.dart';
import 'package:simulive/Auth/model/user.dart';
import 'package:simulive/Auth/repository/auth_repository.dart';
import 'package:simulive/helper/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  // ignore: prefer_final_fields
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel get userModel => _userModel;

  late UserModel _userModel;
  Future<ResponseModel> login(String username, String password) async {
    _isLoading = true;

    update();
    Response response = await authRepository.login(username, password);

    final ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      authRepository.saveUserToken(_userModel.user!.token.toString());
      authRepository.saveUsernameAndPassword(username, password);

      responseModel = ResponseModel(true, "Loggein successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
    // return userModel;
  }

  bool userLoggedin() {
    return authRepository.userLoggedin();
  }

  Future<String> getToken() {
    return authRepository.getUserToken();
  }

  Future<List<String?>> getUsernameAndPassword() {
    return authRepository.getUsernameAndPassword();
  }

  Future<void> saveUsernameAndPassword(String username, String password) async {
    await authRepository.saveUsernameAndPassword(username, password);
  }
}
