import 'package:get/get.dart';
import 'package:simulive/pages/home_page.dart';
import 'package:simulive/pages/login_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String signIn = "/signin";

  static const String movieDetails = "/movie-details";

  static String getInitial() => '$initial';
  static String getPopularMovies(String url) => '$movieDetails?url=$url';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: "/home-page", page: () => HomePage()),
    GetPage(name: signIn, page: () => LoginPage(), transition: Transition.fade),
    // GetPage(
    //   name: "/movie-details",
    //   page: () {
    //     var url = Get.parameters['url'];
    //     return const VideoDetailPage(
    //       url,
    //     );
    //   },
    //   transition: Transition.fadeIn,
    // )
  ];
}
