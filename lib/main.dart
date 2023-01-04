// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/helper/route_helper.dart';
import 'helper/depencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // home: LoginPage(),
    initialRoute: RouteHelper.getInitial(),
    // initialRoute: RouteHelper.getSplashPage(),
    getPages: RouteHelper.routes,
  ));
}
