class PaginationQuery {
  final int categories;
  final int paginate;
  final int limit;
  final int page;

  PaginationQuery(
      {required this.categories,
      required this.paginate,
      required this.limit,
      required this.page});
  static String pagination(categories, paginate, limit, page) {
    String validateCategories;
    if (categories == 0) {
      validateCategories = 'categories';
    } else {
      // ignore: prefer_interpolation_to_compose_strings
      validateCategories = 'categories=' + categories.toString();
    }
    // ignore: prefer_interpolation_to_compose_strings
    String pagination = validateCategories +
        "&" +
        "paginate=" +
        paginate.toString() +
        "&" +
        "limit=" +
        limit.toString() +
        "&" +
        "page=" +
        page.toString();
    return pagination;
  }
}
