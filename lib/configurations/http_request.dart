class HttpRequest {
  static String baseUrl = "https://simulive.co.tz";
  static String seriesUri = "/api/series/list/?";
  static String movieUri = "/api/videos/list/?";
  //https://simulive.co.tz/api/videos/list/?categories&paginate=1&limit=15&page=2
  static String myListUri = "/api/videos/myList?";
  //https://simulive.co.tz/api/videos/myList?page=1&limit=1&paginate=1
  static String trendingVideoUri = "/api/videos/list/?";
  // https://simulive.co.tz/api/videos/list/trending&paginate=1&limit=5&page=1
  static String videoLink =
      "https://encode.simulive.co.tz/api/v1/filename?key=";

  static streamVideoUrl(String videoKey) {
    // X-Authorization: 6SoeJkodMvBqKvSgx8bl0h6pA1PNCJ6qAK6JLEM5oTFKgBRceCWWUP7YW4IGMHob
    // X-Authorization-Secret: aPpeSSII3apLqFlAbPmJsnoA5BWaOGOK6NYE4rrxDxrBA6hel6qHEMHhUeWWpKAI
    Map<String, dynamic> data = {
      "url": "$videoLink$videoKey",
      "X-Authorization":
          "6SoeJkodMvBqKvSgx8bl0h6pA1PNCJ6qAK6JLEM5oTFKgBRceCWWUP7YW4IGMHob",
      "X-Authorization-Secret":
          "aPpeSSII3apLqFlAbPmJsnoA5BWaOGOK6NYE4rrxDxrBA6hel6qHEMHhUeWWpKAI"
    };
    return data;
  }

  static movieUrl(int categories, int paginate, int limit, int page) {
    String categoryId;
    if (categories != 0) {
      categoryId = "categories=$categories";
    } else {
      categoryId = "categories";
    }
    return ("$baseUrl$movieUri$categoryId&paginate=$paginate&limit=$limit&page=$page");
  }

  static seriesUrl(int categories, int paginate, int limit, int page) {
    String categoryId;
    if (categories != 0) {
      categoryId = "categories=$categories";
    } else {
      categoryId = "categories";
    }
    return ("$baseUrl$seriesUri$categoryId&paginate=$paginate&limit=$limit&page=$page");
  }

  static myListUrl(int paginate, int limit, int page) {
    return '$baseUrl${myListUri}paginate=$paginate&limit=$limit&page=$page';
  }

  static trendingVideos(int trending, int paginate, int limit, int page) {
    return '$baseUrl${trendingVideoUri}trending=$trending&paginate=$paginate&limit=$limit&page=$page';
  }
}
