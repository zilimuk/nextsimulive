class VideoCategories {
  int? status;
  String? message;
  List<Categories>? categories;
  String? time;

  VideoCategories({this.status, this.message, this.categories, this.time});

  VideoCategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['time'] = time;
    return data;
  }
}

class Categories {
  int? categoryId;
  int? parentId;
  String? categoryName;
  int? categoryOrder;
  String? categoryDesc;
  String? dateAdded;
  String? categoryThumb;
  String? featured;
  String? isdefault;
  String? navbar;
  int? isTrailer;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? isVideo;
  int? isSeries;
  int? isLive;
  bool? checked;
  int? contentType;

  Categories(
      {this.categoryId,
      this.parentId,
      this.categoryName,
      this.categoryOrder,
      this.categoryDesc,
      this.dateAdded,
      this.categoryThumb,
      this.featured,
      this.isdefault,
      this.navbar,
      this.isTrailer,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.isVideo,
      this.isSeries,
      this.isLive,
      this.checked,
      this.contentType});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    parentId = json['parent_id'];
    categoryName = json['category_name'];
    categoryOrder = json['category_order'];
    categoryDesc = json['category_desc'];
    dateAdded = json['date_added'];
    categoryThumb = json['category_thumb'];
    featured = json['featured'];
    isdefault = json['isdefault'];
    navbar = json['navbar'];
    isTrailer = json['is_trailer'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    isVideo = json['is_video'];
    isSeries = json['is_series'];
    isLive = json['is_live'];
    checked = json['checked'];
    contentType = json['content_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_order'] = categoryOrder;
    data['category_desc'] = categoryDesc;
    data['date_added'] = dateAdded;
    data['category_thumb'] = categoryThumb;
    data['featured'] = featured;
    data['isdefault'] = isdefault;
    data['navbar'] = navbar;
    data['is_trailer'] = isTrailer;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['is_video'] = isVideo;
    data['is_series'] = isSeries;
    data['is_live'] = isLive;
    data['checked'] = checked;
    data['content_type'] = contentType;
    return data;
  }
}
