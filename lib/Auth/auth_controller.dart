import 'dart:convert';

import 'package:get/get.dart';
import 'package:simulive/Auth/model/user.dart';
import 'package:simulive/Auth/repository/auth_repository.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  // ignore: prefer_final_fields
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<UserModel> login(String username, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepository.login(username, password);

    late UserModel userModel;
    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body));
      print(user.toString());
      // authRepository.saveUserToken(userToken);
      // userModel = UserModel(response.body['status'], response.body['message'],
      //     true, response.body['token']);
      // String userToken = userModel.user!.token.toString();
      authRepository.saveUserToken(user.user!.token.toString());
    } else {
      userModel = UserModel(response.body['status'], response.body['message'],
          false, response.statusText!);
    }
    _isLoading = false;
    update();
    return userModel;
    // return userModel;
  }

  Future<void> saveUsernameAndPassword(String username, String password) async {
    await authRepository.saveUsernameAndPassword(username, password);
  }
}
