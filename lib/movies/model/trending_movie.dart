class TrendingVideo {
  int? status;
  String? message;
  TrendingVideoList? videos;
  String? time;

  TrendingVideo({this.status, this.message, this.videos, this.time});

  TrendingVideo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    videos = json['videos'] != null
        ? TrendingVideoList.fromJson(json['videos'])
        : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.videos != null) {
      data['videos'] = this.videos!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class TrendingVideoList {
  Trending? trending;

  TrendingVideoList({this.trending});

  TrendingVideoList.fromJson(Map<String, dynamic> json) {
    trending = json['trending'] != null
        ? new Trending.fromJson(json['trending'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trending != null) {
      data['trending'] = this.trending!.toJson();
    }
    return data;
  }
}

class Trending {
  int? currentPage;
  List<TrendingData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Trending(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Trending.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <TrendingData>[];
      json['data'].forEach((v) {
        data!.add(new TrendingData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class TrendingData {
  int? videoid;
  String? videokey;
  String? videoPassword;
  String? videoUsers;
  String? username;
  int? userid;
  int? partnerId;
  String? maturityLevel;
  String? title;
  String? fileName;
  int? fileType;
  String? description;
  String? tags;
  String? category;
  String? categoryParents;
  String? broadcast;
  String? location;
  String? datecreated;
  String? country;
  String? blockedCountries;
  String? allowedCountries;
  int? spriteCount;
  int? seasonId;
  int? seriesId;
  int? sequence;
  String? allowEmbedding;
  int? rating;
  String? ratedBy;
  String? voterIds;
  String? featured;
  String? featuredOrder;
  String? featuredDate;
  String? featuredDescription;
  String? allowRating;
  String? allowComments;
  int? commentsCount;
  String? lastCommented;
  String? active;
  String? favouriteCount;
  String? playlistCount;
  int? views;
  String? lastViewed;
  String? dateAdded;
  String? flagged;
  String? duration;
  String? status;
  String? failedReason;
  int? defaultThumb;
  String? aspectRatio;
  String? embedCode;
  String? referUrl;
  int? downloads;
  String? uploaderIp;
  String? massEmbedStatus;
  String? uniqueEmbedCode;
  String? remotePlayUrl;
  String? videoFiles;
  String? serverIp;
  String? fileServerPath;
  String? fileDirectory;
  String? filesThumbsPath;
  String? fileThumbsCount;
  String? hasHq;
  String? filegrpSize;
  int? processStatus;
  String? videoVersion;
  String? extras;
  String? subscriptionEmail;
  String? thumbsVersion;
  String? reConvStatus;
  String? convProgress;
  String? isPremium;
  int? overrideDefaultMonetization;
  String? creditsRequired;
  int? rentalHours;
  int? premiumCid;
  String? inEditorPick;
  String? hasSubs;
  int? totalSubs;
  int? lastSubNum;
  String? live;
  String? udpLive;
  String? forceHlsHttpUrl;
  String? startPublishedDate;
  String? endPublishedDate;
  String? hasSprite;
  int? version;
  String? hasResulotion;
  int? awsServiceId;
  String? awsCdn;
  String? awsThumbPath;
  String? licenseBy;
  String? isChanneHome;
  int? contentType;
  int? superFeature;
  int? isAvod;
  int? isTvod;
  int? preOrder;
  int? liveStatus;
  String? deletedAt;
  int? is360;
  String? projectionType;
  String? epgChannelId;
  String? drmProtected;
  String? epgUrl;
  String? contentLanguage;
  String? dvrUrl;
  String? dvrBackupTimezone;
  String? dvrBackupDuration;
  String? epgDvrCatchupUrl;
  String? logo;
  TrendingVideoPortraitThumbs? portraitThumbs;
  Thumbs? thumbs;
  String? gif;
  List<String>? files;
  String? watchUrl;
  String? year;
  String? durationInSeconds;
  int? rate;
  dynamic trailers;
  String? favId;
  String? isFav;
  String? url;
  String? shareable;
  List<Categories>? categories;
  Quality? quality;
  String? interval;
  TrendingVideoSeries? series;
  String? priceTag;
  bool? showPremiumBadge;
  bool? canPreOrder;
  String? availabilityDate;
  String? contentTypeLabel;

  TrendingData(
      {this.videoid,
      this.videokey,
      this.videoPassword,
      this.videoUsers,
      this.username,
      this.userid,
      this.partnerId,
      this.maturityLevel,
      this.title,
      this.fileName,
      this.fileType,
      this.description,
      this.tags,
      this.category,
      this.categoryParents,
      this.broadcast,
      this.location,
      this.datecreated,
      this.country,
      this.blockedCountries,
      this.allowedCountries,
      this.spriteCount,
      this.seasonId,
      this.seriesId,
      this.sequence,
      this.allowEmbedding,
      this.rating,
      this.ratedBy,
      this.voterIds,
      this.featured,
      this.featuredOrder,
      this.featuredDate,
      this.featuredDescription,
      this.allowRating,
      this.allowComments,
      this.commentsCount,
      this.lastCommented,
      this.active,
      this.favouriteCount,
      this.playlistCount,
      this.views,
      this.lastViewed,
      this.dateAdded,
      this.flagged,
      this.duration,
      this.status,
      this.failedReason,
      this.defaultThumb,
      this.aspectRatio,
      this.embedCode,
      this.referUrl,
      this.downloads,
      this.uploaderIp,
      this.massEmbedStatus,
      this.uniqueEmbedCode,
      this.remotePlayUrl,
      this.videoFiles,
      this.serverIp,
      this.fileServerPath,
      this.fileDirectory,
      this.filesThumbsPath,
      this.fileThumbsCount,
      this.hasHq,
      this.filegrpSize,
      this.processStatus,
      this.videoVersion,
      this.extras,
      this.subscriptionEmail,
      this.thumbsVersion,
      this.reConvStatus,
      this.convProgress,
      this.isPremium,
      this.overrideDefaultMonetization,
      this.creditsRequired,
      this.rentalHours,
      this.premiumCid,
      this.inEditorPick,
      this.hasSubs,
      this.totalSubs,
      this.lastSubNum,
      this.live,
      this.udpLive,
      this.forceHlsHttpUrl,
      this.startPublishedDate,
      this.endPublishedDate,
      this.hasSprite,
      this.version,
      this.hasResulotion,
      this.awsServiceId,
      this.awsCdn,
      this.awsThumbPath,
      this.licenseBy,
      this.isChanneHome,
      this.contentType,
      this.superFeature,
      this.isAvod,
      this.isTvod,
      this.preOrder,
      this.liveStatus,
      this.deletedAt,
      this.is360,
      this.projectionType,
      this.epgChannelId,
      this.drmProtected,
      this.epgUrl,
      this.contentLanguage,
      this.dvrUrl,
      this.dvrBackupTimezone,
      this.dvrBackupDuration,
      this.epgDvrCatchupUrl,
      this.logo,
      this.portraitThumbs,
      this.thumbs,
      this.gif,
      this.files,
      this.watchUrl,
      this.year,
      this.durationInSeconds,
      this.rate,
      this.trailers,
      this.favId,
      this.isFav,
      this.url,
      this.shareable,
      this.categories,
      this.quality,
      this.interval,
      this.series,
      this.priceTag,
      this.showPremiumBadge,
      this.canPreOrder,
      this.availabilityDate,
      this.contentTypeLabel});

  TrendingData.fromJson(Map<String, dynamic> json) {
    videoid = json['videoid'];
    videokey = json['videokey'];
    videoPassword = json['video_password'];
    videoUsers = json['video_users'];
    username = json['username'];
    userid = json['userid'];
    partnerId = json['partner_id'];
    maturityLevel = json['maturity_level'];
    title = json['title'];
    fileName = json['file_name'];
    fileType = json['file_type'];
    description = json['description'];
    tags = json['tags'];
    category = json['category'];
    categoryParents = json['category_parents'];
    broadcast = json['broadcast'];
    location = json['location'];
    datecreated = json['datecreated'];
    country = json['country'];
    blockedCountries = json['blocked_countries'];
    allowedCountries = json['allowed_countries'];
    spriteCount = json['sprite_count'];
    seasonId = json['season_id'];
    seriesId = json['series_id'];
    sequence = json['sequence'];
    allowEmbedding = json['allow_embedding'];
    rating = json['rating'];
    ratedBy = json['rated_by'];
    voterIds = json['voter_ids'];
    featured = json['featured'];
    featuredOrder = json['featured_order'];
    featuredDate = json['featured_date'];
    featuredDescription = json['featured_description'];
    allowRating = json['allow_rating'];
    allowComments = json['allow_comments'];
    commentsCount = json['comments_count'];
    lastCommented = json['last_commented'];
    active = json['active'];
    favouriteCount = json['favourite_count'];
    playlistCount = json['playlist_count'];
    views = json['views'];
    lastViewed = json['last_viewed'];
    dateAdded = json['date_added'];
    flagged = json['flagged'];
    duration = json['duration'];
    status = json['status'];
    failedReason = json['failed_reason'];
    defaultThumb = json['default_thumb'];
    aspectRatio = json['aspect_ratio'];
    embedCode = json['embed_code'];
    referUrl = json['refer_url'];
    downloads = json['downloads'];
    uploaderIp = json['uploader_ip'];
    massEmbedStatus = json['mass_embed_status'];
    uniqueEmbedCode = json['unique_embed_code'];
    remotePlayUrl = json['remote_play_url'];
    videoFiles = json['video_files'];
    serverIp = json['server_ip'];
    fileServerPath = json['file_server_path'];
    fileDirectory = json['file_directory'];
    filesThumbsPath = json['files_thumbs_path'];
    fileThumbsCount = json['file_thumbs_count'];
    hasHq = json['has_hq'];
    filegrpSize = json['filegrp_size'];
    processStatus = json['process_status'];
    videoVersion = json['video_version'];
    extras = json['extras'];
    subscriptionEmail = json['subscription_email'];
    thumbsVersion = json['thumbs_version'];
    reConvStatus = json['re_conv_status'];
    convProgress = json['conv_progress'];
    isPremium = json['is_premium'];
    overrideDefaultMonetization = json['override_default_monetization'];
    creditsRequired = json['credits_required'];
    rentalHours = json['rental_hours'];
    premiumCid = json['premium_cid'];
    inEditorPick = json['in_editor_pick'];
    hasSubs = json['has_subs'];
    totalSubs = json['total_subs'];
    lastSubNum = json['last_sub_num'];
    live = json['live'];
    udpLive = json['udp_live'];
    forceHlsHttpUrl = json['force_hls_http_url'];
    startPublishedDate = json['start_published_date'];
    endPublishedDate = json['end_published_date'];
    hasSprite = json['has_sprite'];
    version = json['version'];
    hasResulotion = json['has_resulotion'];
    awsServiceId = json['aws_service_id'];
    awsCdn = json['aws_cdn'];
    awsThumbPath = json['aws_thumb_path'];
    licenseBy = json['license_by'];
    isChanneHome = json['is_channeHome'];
    contentType = json['content_type'];
    superFeature = json['super_feature'];
    isAvod = json['is_avod'];
    isTvod = json['is_tvod'];
    preOrder = json['pre_order'];
    liveStatus = json['live_status'];
    deletedAt = json['deleted_at'];
    is360 = json['is_360'];
    projectionType = json['projection_type'];
    epgChannelId = json['epg_channel_id'];
    drmProtected = json['drm_protected'];
    epgUrl = json['epg_url'];
    contentLanguage = json['content_language'];
    dvrUrl = json['dvr_url'];
    dvrBackupTimezone = json['dvr_backup_timezone'];
    dvrBackupDuration = json['dvr_backup_duration'];
    epgDvrCatchupUrl = json['epg_dvr_catchup_url'];
    logo = json['logo'];
    thumbs = json['thumbs'] != null ? Thumbs.fromJson(json['thumbs']) : null;
    gif = json['gif'];
    files = json['files'].cast<String>();
    watchUrl = json['watch_url'];
    year = json['year'];
    durationInSeconds = json['duration_in_seconds'];
    rate = json['rate'];
    trailers = json['trailers'];
    favId = json['fav_id'];
    isFav = json['is_fav'];
    url = json['url'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    quality =
        json['quality'] != null ? new Quality.fromJson(json['quality']) : null;
    interval = json['interval'];
    series = json['series'] != null
        ? TrendingVideoSeries.fromJson(json['series'])
        : null;
    priceTag = json['price_tag'];
    showPremiumBadge = json['show_premium_badge'];
    canPreOrder = json['can_pre_order'];
    availabilityDate = json['availability_date'];
    contentTypeLabel = json['content_type_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoid'] = this.videoid;
    data['videokey'] = this.videokey;
    data['video_password'] = this.videoPassword;
    data['video_users'] = this.videoUsers;
    data['username'] = this.username;
    data['userid'] = this.userid;
    data['partner_id'] = this.partnerId;
    data['maturity_level'] = this.maturityLevel;
    data['title'] = this.title;
    data['file_name'] = this.fileName;
    data['file_type'] = this.fileType;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['category'] = this.category;
    data['category_parents'] = this.categoryParents;
    data['broadcast'] = this.broadcast;
    data['location'] = this.location;
    data['datecreated'] = this.datecreated;
    data['country'] = this.country;
    data['blocked_countries'] = this.blockedCountries;
    data['allowed_countries'] = this.allowedCountries;
    data['sprite_count'] = this.spriteCount;
    data['season_id'] = this.seasonId;
    data['series_id'] = this.seriesId;
    data['sequence'] = this.sequence;
    data['allow_embedding'] = this.allowEmbedding;
    data['rating'] = this.rating;
    data['rated_by'] = this.ratedBy;
    data['voter_ids'] = this.voterIds;
    data['featured'] = this.featured;
    data['featured_order'] = this.featuredOrder;
    data['featured_date'] = this.featuredDate;
    data['featured_description'] = this.featuredDescription;
    data['allow_rating'] = this.allowRating;
    data['allow_comments'] = this.allowComments;
    data['comments_count'] = this.commentsCount;
    data['last_commented'] = this.lastCommented;
    data['active'] = this.active;
    data['favourite_count'] = this.favouriteCount;
    data['playlist_count'] = this.playlistCount;
    data['views'] = this.views;
    data['last_viewed'] = this.lastViewed;
    data['date_added'] = this.dateAdded;
    data['flagged'] = this.flagged;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['failed_reason'] = this.failedReason;
    data['default_thumb'] = this.defaultThumb;
    data['aspect_ratio'] = this.aspectRatio;
    data['embed_code'] = this.embedCode;
    data['refer_url'] = this.referUrl;
    data['downloads'] = this.downloads;
    data['uploader_ip'] = this.uploaderIp;
    data['mass_embed_status'] = this.massEmbedStatus;
    data['unique_embed_code'] = this.uniqueEmbedCode;
    data['remote_play_url'] = this.remotePlayUrl;
    data['video_files'] = this.videoFiles;
    data['server_ip'] = this.serverIp;
    data['file_server_path'] = this.fileServerPath;
    data['file_directory'] = this.fileDirectory;
    data['files_thumbs_path'] = this.filesThumbsPath;
    data['file_thumbs_count'] = this.fileThumbsCount;
    data['has_hq'] = this.hasHq;
    data['filegrp_size'] = this.filegrpSize;
    data['process_status'] = this.processStatus;
    data['video_version'] = this.videoVersion;
    data['extras'] = this.extras;
    data['subscription_email'] = this.subscriptionEmail;
    data['thumbs_version'] = this.thumbsVersion;
    data['re_conv_status'] = this.reConvStatus;
    data['conv_progress'] = this.convProgress;
    data['is_premium'] = this.isPremium;
    data['override_default_monetization'] = this.overrideDefaultMonetization;
    data['credits_required'] = this.creditsRequired;
    data['rental_hours'] = this.rentalHours;
    data['premium_cid'] = this.premiumCid;
    data['in_editor_pick'] = this.inEditorPick;
    data['has_subs'] = this.hasSubs;
    data['total_subs'] = this.totalSubs;
    data['last_sub_num'] = this.lastSubNum;
    data['live'] = this.live;
    data['udp_live'] = this.udpLive;
    data['force_hls_http_url'] = this.forceHlsHttpUrl;
    data['start_published_date'] = this.startPublishedDate;
    data['end_published_date'] = this.endPublishedDate;
    data['has_sprite'] = this.hasSprite;
    data['version'] = this.version;
    data['has_resulotion'] = this.hasResulotion;
    data['aws_service_id'] = this.awsServiceId;
    data['aws_cdn'] = this.awsCdn;
    data['aws_thumb_path'] = this.awsThumbPath;
    data['license_by'] = this.licenseBy;
    data['is_channeHome'] = this.isChanneHome;
    data['content_type'] = this.contentType;
    data['super_feature'] = this.superFeature;
    data['is_avod'] = this.isAvod;
    data['is_tvod'] = this.isTvod;
    data['pre_order'] = this.preOrder;
    data['live_status'] = this.liveStatus;
    data['deleted_at'] = this.deletedAt;
    data['is_360'] = this.is360;
    data['projection_type'] = this.projectionType;
    data['epg_channel_id'] = this.epgChannelId;
    data['drm_protected'] = this.drmProtected;
    data['epg_url'] = this.epgUrl;
    data['content_language'] = this.contentLanguage;
    data['dvr_url'] = this.dvrUrl;
    data['dvr_backup_timezone'] = this.dvrBackupTimezone;
    data['dvr_backup_duration'] = this.dvrBackupDuration;
    data['epg_dvr_catchup_url'] = this.epgDvrCatchupUrl;
    data['logo'] = this.logo;
    if (this.portraitThumbs != null) {
      data['portrait_thumbs'] = this.portraitThumbs!.toJson();
    }
    if (this.thumbs != null) {
      data['thumbs'] = this.thumbs!.toJson();
    }
    data['gif'] = this.gif;
    data['files'] = this.files;
    data['watch_url'] = this.watchUrl;
    data['year'] = this.year;
    data['duration_in_seconds'] = this.durationInSeconds;
    data['rate'] = this.rate;
    data['trailers'] = this.trailers;
    data['fav_id'] = this.favId;
    data['is_fav'] = this.isFav;
    data['url'] = this.url;
    data['shareable'] = this.shareable;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.quality != null) {
      data['quality'] = this.quality!.toJson();
    }
    data['interval'] = this.interval;
    if (this.series != null) {
      data['series'] = this.series!.toJson();
    }
    data['price_tag'] = this.priceTag;
    data['show_premium_badge'] = this.showPremiumBadge;
    data['can_pre_order'] = this.canPreOrder;
    data['availability_date'] = this.availabilityDate;
    data['content_type_label'] = this.contentTypeLabel;
    return data;
  }
}

class TrendingVideoPortraitThumbs {
  String? original;
  String? s160x240;
  String? s240x360;
  String? s320x480;
  String? s480x720;
  String? s720x1080;

  TrendingVideoPortraitThumbs(
      {this.original,
      this.s160x240,
      this.s240x360,
      this.s320x480,
      this.s480x720,
      this.s720x1080});

  TrendingVideoPortraitThumbs.fromJson(Map<String, dynamic> json) {
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
      this.isLive});

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
    return data;
  }
}

class Quality {
  String? hd;
  String? uhd;

  Quality({this.hd, this.uhd});

  Quality.fromJson(Map<String, dynamic> json) {
    hd = json['hd'];
    uhd = json['uhd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hd'] = this.hd;
    data['uhd'] = this.uhd;
    return data;
  }
}

class TrendingVideoSeries {
  int? seriesId;
  String? seriesName;
  String? seriesDescription;
  String? seriesTags;
  String? maturityLevel;
  String? category;
  int? userid;
  int? partnerId;
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
  String? priceTag;
  String? contentTypeLabel;
  String? title;

  TrendingVideoSeries(
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
      this.priceTag,
      this.contentTypeLabel,
      this.title});

  TrendingVideoSeries.fromJson(Map<String, dynamic> json) {
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
    priceTag = json['price_tag'];
    contentTypeLabel = json['content_type_label'];
    title = json['title'];
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
    data['price_tag'] = this.priceTag;
    data['content_type_label'] = this.contentTypeLabel;
    data['title'] = this.title;
    return data;
  }
}
