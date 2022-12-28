class Series {
  late int status;
  late String message;
  late List<ListSeries> listSeries;

  Series(
      {required this.status, required this.message, required this.listSeries});

  Series.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['series'] != null) {
      listSeries = <ListSeries>[];
      json['series'].forEach((v) {
        listSeries.add(new ListSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.listSeries != null) {
      data['series'] = this.listSeries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListSeries {
  late int seriesId;
  late String seriesName;
  late String seriesDescription;
  late String seriesTags;
  late String maturityLevel;
  late String category;
  late int userid;
  late Null partnerId;
  late int views;
  late String dateAdded;
  late String featured;
  late String broadcast;
  late String allowComments;
  late String allowRating;
  late int totalComments;
  late String lastCommented;
  late int totalObjects;
  late int rating;
  late int ratedBy;
  late String voters;
  late String active;
  late String publicUpload;
  late String type;
  late String fileDirectory;
  late Null startPublishedDate;
  late Null endPublishedDate;
  late String thumbsUpdatedOn;
  late int superFeature;
  late Null realeaseDate;
  late int isAvod;
  late int isTvod;
  late int isSvod;
  late String creditsRequired;
  late int rentalHours;
  late int overrideDefaultMonetization;
  late Null startReleasedDate;
  late Null endReleasedDate;
  late Null deletedAt;
  late int seasonCount;
  late Null contentLanguage;
  late String username;
  late Null logo;
  late PortraitThumbs portraitThumbs;
  late String thumb;
  late Thumbs thumbs;
  late List<Categories> categories;
  late String shareable;
  late Trailers trailers;
  late Trailers trailer;
  late Null favId;
  late Null isFav;
  late Null isFavourite;
  late int firstEpisodeId;
  late int firstSeasonId;
  late String year;
  late int creditsRequiredOrignal;
  late String currencySymbol;
  late String contentTypeLabel;
  late int contentType;
  late int rate;
  late bool loggedInUser;

  ListSeries(
      {required this.seriesId,
      required this.seriesName,
      required this.seriesDescription,
      required this.seriesTags,
      required this.maturityLevel,
      required this.category,
      required this.userid,
      required this.partnerId,
      required this.views,
      required this.dateAdded,
      required this.featured,
      required this.broadcast,
      required this.allowComments,
      required this.allowRating,
      required this.totalComments,
      required this.lastCommented,
      required this.totalObjects,
      required this.rating,
      required this.ratedBy,
      required this.voters,
      required this.active,
      required this.publicUpload,
      required this.type,
      required this.fileDirectory,
      required this.startPublishedDate,
      required this.endPublishedDate,
      required this.thumbsUpdatedOn,
      required this.superFeature,
      required this.realeaseDate,
      required this.isAvod,
      required this.isTvod,
      required this.isSvod,
      required this.creditsRequired,
      required this.rentalHours,
      required this.overrideDefaultMonetization,
      required this.startReleasedDate,
      required this.endReleasedDate,
      required this.deletedAt,
      required this.seasonCount,
      required this.contentLanguage,
      required this.username,
      required this.logo,
      required this.portraitThumbs,
      required this.thumb,
      required this.thumbs,
      required this.categories,
      required this.shareable,
      required this.trailers,
      required this.trailer,
      required this.favId,
      required this.isFav,
      required this.isFavourite,
      required this.firstEpisodeId,
      required this.firstSeasonId,
      required this.year,
      required this.creditsRequiredOrignal,
      required this.currencySymbol,
      required this.contentTypeLabel,
      required this.contentType,
      required this.rate,
      required this.loggedInUser});

  ListSeries.fromJson(Map<String, dynamic> json) {
    seriesId = json['series_id'];
    seriesName = json['series_name'];
    seriesDescription = json['series_description'];
    seriesTags = json['series_tags'];
    maturityLevel = json['maturity_level'];
    category = json['category'];
    userid = json['userid'];
    partnerId = json['partner_id'];
    views = json['views'];
    dateAdded = json['date_added'];
    featured = json['featured'];
    broadcast = json['broadcast'];
    allowComments = json['allow_comments'];
    allowRating = json['allow_rating'];
    totalComments = json['total_comments'];
    lastCommented = json['last_commented'];
    totalObjects = json['total_objects'];
    rating = json['rating'];
    ratedBy = json['rated_by'];
    voters = json['voters'];
    active = json['active'];
    publicUpload = json['public_upload'];
    type = json['type'];
    fileDirectory = json['file_directory'];
    startPublishedDate = json['start_published_date'];
    endPublishedDate = json['end_published_date'];
    thumbsUpdatedOn = json['thumbs_updated_on'];
    superFeature = json['super_feature'];
    realeaseDate = json['realease_date'];
    isAvod = json['is_avod'];
    isTvod = json['is_tvod'];
    isSvod = json['is_svod'];
    creditsRequired = json['credits_required'];
    rentalHours = json['rental_hours'];
    overrideDefaultMonetization = json['override_default_monetization'];
    startReleasedDate = json['start_released_date'];
    endReleasedDate = json['end_released_date'];
    deletedAt = json['deleted_at'];
    seasonCount = json['season_count'];
    contentLanguage = json['content_language'];
    username = json['username'];
    logo = json['logo'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    shareable = json['shareable'];
    favId = json['fav_id'];
    isFav = json['is_fav'];
    isFavourite = json['is_favourite'];
    firstEpisodeId = json['first_episode_id'];
    firstSeasonId = json['first_season_id'];
    year = json['year'];
    creditsRequiredOrignal = json['credits_required_orignal'];
    currencySymbol = json['currency_symbol'];
    contentTypeLabel = json['content_type_label'];
    contentType = json['content_type'];
    rate = json['rate'];
    loggedInUser = json['logged_in_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['series_id'] = this.seriesId;
    data['series_name'] = this.seriesName;
    data['series_description'] = this.seriesDescription;
    data['series_tags'] = this.seriesTags;
    data['maturity_level'] = this.maturityLevel;
    data['category'] = this.category;
    data['userid'] = this.userid;
    data['partner_id'] = this.partnerId;
    data['views'] = this.views;
    data['date_added'] = this.dateAdded;
    data['featured'] = this.featured;
    data['broadcast'] = this.broadcast;
    data['allow_comments'] = this.allowComments;
    data['allow_rating'] = this.allowRating;
    data['total_comments'] = this.totalComments;
    data['last_commented'] = this.lastCommented;
    data['total_objects'] = this.totalObjects;
    data['rating'] = this.rating;
    data['rated_by'] = this.ratedBy;
    data['voters'] = this.voters;
    data['active'] = this.active;
    data['public_upload'] = this.publicUpload;
    data['type'] = this.type;
    data['file_directory'] = this.fileDirectory;
    data['start_published_date'] = this.startPublishedDate;
    data['end_published_date'] = this.endPublishedDate;
    data['thumbs_updated_on'] = this.thumbsUpdatedOn;
    data['super_feature'] = this.superFeature;
    data['realease_date'] = this.realeaseDate;
    data['is_avod'] = this.isAvod;
    data['is_tvod'] = this.isTvod;
    data['is_svod'] = this.isSvod;
    data['credits_required'] = this.creditsRequired;
    data['rental_hours'] = this.rentalHours;
    data['override_default_monetization'] = this.overrideDefaultMonetization;
    data['start_released_date'] = this.startReleasedDate;
    data['end_released_date'] = this.endReleasedDate;
    data['deleted_at'] = this.deletedAt;
    data['season_count'] = this.seasonCount;
    data['content_language'] = this.contentLanguage;
    data['username'] = this.username;
    data['logo'] = this.logo;
    if (this.portraitThumbs != null) {
      data['portrait_thumbs'] = this.portraitThumbs.toJson();
    }
    data['thumb'] = this.thumb;
    if (this.thumbs != null) {
      data['thumbs'] = this.thumbs.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['shareable'] = this.shareable;
    if (this.trailers != null) {
      data['trailers'] = this.trailers.toJson();
    }
    if (this.trailer != null) {
      data['trailer'] = this.trailer.toJson();
    }
    data['fav_id'] = this.favId;
    data['is_fav'] = this.isFav;
    data['is_favourite'] = this.isFavourite;
    data['first_episode_id'] = this.firstEpisodeId;
    data['first_season_id'] = this.firstSeasonId;
    data['year'] = this.year;
    data['credits_required_orignal'] = this.creditsRequiredOrignal;
    data['currency_symbol'] = this.currencySymbol;
    data['content_type_label'] = this.contentTypeLabel;
    data['content_type'] = this.contentType;
    data['rate'] = this.rate;
    data['logged_in_user'] = this.loggedInUser;
    return data;
  }
}

class PortraitThumbs {
  late String original;
  late String s160x240;
  late String s240x360;
  late String s320x480;
  late String s480x720;
  late String s720x1080;

  PortraitThumbs(
      {required this.original,
      required this.s160x240,
      required this.s240x360,
      required this.s320x480,
      required this.s480x720,
      required this.s720x1080});

  PortraitThumbs.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    s160x240 = json['160x240'];
    s240x360 = json['240x360'];
    s320x480 = json['320x480'];
    s480x720 = json['480x720'];
    s720x1080 = json['720x1080'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['160x240'] = this.s160x240;
    data['240x360'] = this.s240x360;
    data['320x480'] = this.s320x480;
    data['480x720'] = this.s480x720;
    data['720x1080'] = this.s720x1080;
    return data;
  }
}

class Thumbs {
  late String original;
  late String s168x105;
  late String s416x260;
  late String s632x395;
  late String s768x432;
  late String s1280x720;
  late String s1920x1080;
  late String s200x288;

  Thumbs(
      {required this.original,
      required this.s168x105,
      required this.s416x260,
      required this.s632x395,
      required this.s768x432,
      required this.s1280x720,
      required this.s1920x1080,
      required this.s200x288});

  Thumbs.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    s168x105 = json['168x105'];
    s416x260 = json['416x260'];
    s632x395 = json['632x395'];
    s768x432 = json['768x432'];
    s1280x720 = json['1280x720'];
    s1920x1080 = json['1920x1080'];
    s200x288 = json['200x288'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['168x105'] = this.s168x105;
    data['416x260'] = this.s416x260;
    data['632x395'] = this.s632x395;
    data['768x432'] = this.s768x432;
    data['1280x720'] = this.s1280x720;
    data['1920x1080'] = this.s1920x1080;
    data['200x288'] = this.s200x288;
    return data;
  }
}

class Categories {
  late int categoryId;
  late int parentId;
  late String categoryName;
  late int categoryOrder;
  late String categoryDesc;
  late String dateAdded;
  late String categoryThumb;
  late String featured;
  late String isdefault;
  late String navbar;
  late int isTrailer;
  late String metaTitle;
  late Null metaDescription;
  late String metaKeywords;
  late String isVideo;
  late String isSeries;
  late String isLive;
  late bool checked;

  Categories(
      {required this.categoryId,
      required this.parentId,
      required this.categoryName,
      required this.categoryOrder,
      required this.categoryDesc,
      required this.dateAdded,
      required this.categoryThumb,
      required this.featured,
      required this.isdefault,
      required this.navbar,
      required this.isTrailer,
      required this.metaTitle,
      required this.metaDescription,
      required this.metaKeywords,
      required this.isVideo,
      required this.isSeries,
      required this.isLive,
      required this.checked});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['parent_id'] = this.parentId;
    data['category_name'] = this.categoryName;
    data['category_order'] = this.categoryOrder;
    data['category_desc'] = this.categoryDesc;
    data['date_added'] = this.dateAdded;
    data['category_thumb'] = this.categoryThumb;
    data['featured'] = this.featured;
    data['isdefault'] = this.isdefault;
    data['navbar'] = this.navbar;
    data['is_trailer'] = this.isTrailer;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['is_video'] = this.isVideo;
    data['is_series'] = this.isSeries;
    data['is_live'] = this.isLive;
    data['checked'] = this.checked;
    return data;
  }
}

class Trailers {
  late String contentTrailerId;
  late String trailerId;
  late String contentId;
  late String contentType;
  late String order;
  late String createdAt;
  late Null updatedAt;
  late String active;
  late String status;

  Trailers(
      {required this.contentTrailerId,
      required this.trailerId,
      required this.contentId,
      required this.contentType,
      required this.order,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.status});

  Trailers.fromJson(Map<String, dynamic> json) {
    contentTrailerId = json['content_trailer_id'];
    trailerId = json['trailer_id'];
    contentId = json['content_id'];
    contentType = json['content_type'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_trailer_id'] = this.contentTrailerId;
    data['trailer_id'] = this.trailerId;
    data['content_id'] = this.contentId;
    data['content_type'] = this.contentType;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    data['status'] = this.status;
    return data;
  }
}
