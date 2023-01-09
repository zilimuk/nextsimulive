class SeriesList {
  int? status;
  String? message;
  Series? series;

  SeriesList({this.status, this.message, this.series});

  SeriesList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (series != null) {
      data['series'] = series!.toJson();
    }
    return data;
  }
}

class Series {
  String? currentPage;
  List<SeriesData>? data;

  Series({this.currentPage, this.data});

  Series.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <SeriesData>[];
      json['data'].forEach((v) {
        data!.add(SeriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeriesData {
  int? seriesId;
  String? seriesName;
  String? seriesDescription;
  String? seriesTags;
  String? maturityLevel;
  String? category;
  int? userid;
  String? partnerId;
  int? views;
  String? dateAdded;
  String? featured;
  String? broadcast;
  String? allowComments;
  String? allowRating;
  int? totalComments;
  String? lastCommented;
  int? totalObjects;
  int? rating;
  int? ratedBy;
  String? voters;
  String? active;
  String? publicUpload;
  String? type;
  String? fileDirectory;
  String? startPublishedDate;
  String? endPublishedDate;
  String? thumbsUpdatedOn;
  int? superFeature;
  String? realeaseDate;
  int? isAvod;
  int? isTvod;
  int? isSvod;
  String? creditsRequired;
  int? rentalHours;
  int? overrideDefaultMonetization;
  String? startReleasedDate;
  String? endReleasedDate;
  String? deletedAt;
  int? seasonCount;
  String? contentLanguage;
  String? username;
  String? logo;
  PortraitThumbs? portraitThumbs;
  String? thumb;
  Thumbs? thumbs;
  List<Categories>? categories;
  String? shareable;
  Trailers? trailers;
  Trailers? trailer;
  String? favId;
  String? isFav;
  String? isFavourite;
  int? firstEpisodeId;
  int? firstSeasonId;
  String? year;
  int? creditsRequiredOrignal;
  String? currencySymbol;
  String? contentTypeLabel;
  int? contentType;
  int? rate;
  bool? loggedInUser;

  SeriesData(
      {this.seriesId,
      this.seriesName,
      this.seriesDescription,
      this.seriesTags,
      this.maturityLevel,
      this.category,
      this.userid,
      this.partnerId,
      this.views,
      this.dateAdded,
      this.featured,
      this.broadcast,
      this.allowComments,
      this.allowRating,
      this.totalComments,
      this.lastCommented,
      this.totalObjects,
      this.rating,
      this.ratedBy,
      this.voters,
      this.active,
      this.publicUpload,
      this.type,
      this.fileDirectory,
      this.startPublishedDate,
      this.endPublishedDate,
      this.thumbsUpdatedOn,
      this.superFeature,
      this.realeaseDate,
      this.isAvod,
      this.isTvod,
      this.isSvod,
      this.creditsRequired,
      this.rentalHours,
      this.overrideDefaultMonetization,
      this.startReleasedDate,
      this.endReleasedDate,
      this.deletedAt,
      this.seasonCount,
      this.contentLanguage,
      this.username,
      this.logo,
      this.portraitThumbs,
      this.thumb,
      this.thumbs,
      this.categories,
      this.shareable,
      this.trailers,
      this.trailer,
      this.favId,
      this.isFav,
      this.isFavourite,
      this.firstEpisodeId,
      this.firstSeasonId,
      this.year,
      this.creditsRequiredOrignal,
      this.currencySymbol,
      this.contentTypeLabel,
      this.contentType,
      this.rate,
      this.loggedInUser});

  SeriesData.fromJson(Map<String, dynamic> json) {
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
    portraitThumbs = json['portrait_thumbs'] != null
        ? PortraitThumbs.fromJson(json['portrait_thumbs'])
        : null;
    thumb = json['thumb'];
    thumbs = json['thumbs'] != null ? Thumbs.fromJson(json['thumbs']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    shareable = json['shareable'];
    trailers =
        json['trailers'] != null ? Trailers.fromJson(json['trailers']) : null;
    trailer =
        json['trailer'] != null ? Trailers.fromJson(json['trailer']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['series_id'] = seriesId;
    data['series_name'] = seriesName;
    data['series_description'] = seriesDescription;
    data['series_tags'] = seriesTags;
    data['maturity_level'] = maturityLevel;
    data['category'] = category;
    data['userid'] = userid;
    data['partner_id'] = partnerId;
    data['views'] = views;
    data['date_added'] = dateAdded;
    data['featured'] = featured;
    data['broadcast'] = broadcast;
    data['allow_comments'] = allowComments;
    data['allow_rating'] = allowRating;
    data['total_comments'] = totalComments;
    data['last_commented'] = lastCommented;
    data['total_objects'] = totalObjects;
    data['rating'] = rating;
    data['rated_by'] = ratedBy;
    data['voters'] = voters;
    data['active'] = active;
    data['public_upload'] = publicUpload;
    data['type'] = type;
    data['file_directory'] = fileDirectory;
    data['start_published_date'] = startPublishedDate;
    data['end_published_date'] = endPublishedDate;
    data['thumbs_updated_on'] = thumbsUpdatedOn;
    data['super_feature'] = superFeature;
    data['realease_date'] = realeaseDate;
    data['is_avod'] = isAvod;
    data['is_tvod'] = isTvod;
    data['is_svod'] = isSvod;
    data['credits_required'] = creditsRequired;
    data['rental_hours'] = rentalHours;
    data['override_default_monetization'] = overrideDefaultMonetization;
    data['start_released_date'] = startReleasedDate;
    data['end_released_date'] = endReleasedDate;
    data['deleted_at'] = deletedAt;
    data['season_count'] = seasonCount;
    data['content_language'] = contentLanguage;
    data['username'] = username;
    data['logo'] = logo;
    if (portraitThumbs != null) {
      data['portrait_thumbs'] = portraitThumbs!.toJson();
    }
    data['thumb'] = thumb;
    if (thumbs != null) {
      data['thumbs'] = thumbs!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['shareable'] = shareable;
    if (trailers != null) {
      data['trailers'] = trailers!.toJson();
    }
    if (trailer != null) {
      data['trailer'] = trailer!.toJson();
    }
    data['fav_id'] = favId;
    data['is_fav'] = isFav;
    data['is_favourite'] = isFavourite;
    data['first_episode_id'] = firstEpisodeId;
    data['first_season_id'] = firstSeasonId;
    data['year'] = year;
    data['credits_required_orignal'] = creditsRequiredOrignal;
    data['currency_symbol'] = currencySymbol;
    data['content_type_label'] = contentTypeLabel;
    data['content_type'] = contentType;
    data['rate'] = rate;
    data['logged_in_user'] = loggedInUser;
    return data;
  }
}

class PortraitThumbs {
  String? original;
  String? s160x240;
  String? s240x360;
  String? s320x480;
  String? s480x720;
  String? s720x1080;

  PortraitThumbs(
      {this.original,
      this.s160x240,
      this.s240x360,
      this.s320x480,
      this.s480x720,
      this.s720x1080});

  PortraitThumbs.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    s160x240 = json['160x240'];
    s240x360 = json['240x360'];
    s320x480 = json['320x480'];
    s480x720 = json['480x720'];
    s720x1080 = json['720x1080'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original'] = original;
    data['160x240'] = s160x240;
    data['240x360'] = s240x360;
    data['320x480'] = s320x480;
    data['480x720'] = s480x720;
    data['720x1080'] = s720x1080;
    return data;
  }
}

class Thumbs {
  String? original;
  String? s168x105;
  String? s416x260;
  String? s632x395;
  String? s768x432;
  String? s1280x720;
  String? s1920x1080;
  String? s200x288;

  Thumbs(
      {this.original,
      this.s168x105,
      this.s416x260,
      this.s632x395,
      this.s768x432,
      this.s1280x720,
      this.s1920x1080,
      this.s200x288});

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original'] = original;
    data['168x105'] = s168x105;
    data['416x260'] = s416x260;
    data['632x395'] = s632x395;
    data['768x432'] = s768x432;
    data['1280x720'] = s1280x720;
    data['1920x1080'] = s1920x1080;
    data['200x288'] = s200x288;
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
  String? isVideo;
  String? isSeries;
  String? isLive;
  bool? checked;

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
      this.checked});

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
    return data;
  }
}

class Trailers {
  String? contentTrailerId;
  String? trailerId;
  String? contentId;
  String? contentType;
  String? order;
  String? createdAt;
  String? updatedAt;
  String? active;
  String? status;

  Trailers(
      {this.contentTrailerId,
      this.trailerId,
      this.contentId,
      this.contentType,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.active,
      this.status});

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content_trailer_id'] = contentTrailerId;
    data['trailer_id'] = trailerId;
    data['content_id'] = contentId;
    data['content_type'] = contentType;
    data['order'] = order;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['active'] = active;
    data['status'] = status;
    return data;
  }
}
