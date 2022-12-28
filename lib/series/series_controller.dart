import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simulive/series/model/series.dart';

// late List<Series> _seriesList;
// Future<Series> fetchSeries() async {
//   final response =
//       await http.get(Uri.parse('https://simulive.co.tz/api/series/list/'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     _seriesList = [];
//     print(_seriesList);
//     jsonDecode(response.body)
//         .forEach((series) => _seriesList.add(Series.fromJson(series)));
//     return _seriesList;
//     // return Series.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load series');
//   }
// }

class HttpService {
  final String postsURL = "https://simulive.co.tz/api/series/list/'";

  Future<List<Series>> fetchSeries() async {
    http.Response res =
        await http.get(Uri.parse('https://simulive.co.tz/api/series/list/'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Series> listSeries = body
          .map(
            (dynamic item) => Series.fromJson(item),
          )
          .toList();

      return listSeries;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
