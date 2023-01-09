// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/helper/route_helper.dart';
import 'helper/depencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: RouteHelper.getInitial(),
      // initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
  }
}
