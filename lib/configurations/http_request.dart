class HttpRequest {
  static String baseUrl = "https://simulive.co.tz";
  static String seriesUri = "/api/series/list/?";
  static String movieUri = "/api/videos/list/?";
  //https://simulive.co.tz/api/videos/list/?categories&paginate=1&limit=15&page=2
  static String myListUri = "/api/videos/myList?";
  //https://simulive.co.tz/api/videos/myList?page=1&limit=1&paginate=1
  static String trendingVideoUri = "/api/videos/list/trending?";
  // https://simulive.co.tz/api/videos/list/trending&paginate=1&limit=5&page=1

  static movieUrl(int categories, int paginate, int limit, int page) {
    String categoryId;
    if (categories != 0) {
      categoryId = "categories=" + categories.toString();
    } else {
      categoryId = "categories";
    }
    return ("$baseUrl$movieUri$categoryId&paginate=$paginate&limit=$limit&page=$page");
  }

  static seriesUrl(int categories, int paginate, int limit, int page) {
    String categoryId;
    if (categories != 0) {
      categoryId = "categories=" + categories.toString();
    } else {
      categoryId = "categories";
    }
    return ("$baseUrl$seriesUri$categoryId&paginate=$paginate&limit=$limit&page=$page");
  }

  static myListUrl(int paginate, int limit, int page) {
    return '$baseUrl${myListUri}paginate=$paginate&limit=$limit&page=$page';
  }

  static trendingVideos(int paginate, int limit, int page) {
    return '$baseUrl${trendingVideoUri}pagigane=$paginate&limit=$limit&page=$page';
  }
}
