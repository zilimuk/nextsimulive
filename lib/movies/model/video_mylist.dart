// ignore_for_file: unnecessary_new, prefer_collection_literals

class VideoMyList {
  int? status;
  String? message;
  MyData? data;
  String? time;

  VideoMyList({this.status, this.message, this.data, this.time});

  VideoMyList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new MyData.fromJson(json['data']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['time'] = time;
    return data;
  }
}

class MyData {
  MyList? myList;

  MyData({this.myList});

  MyData.fromJson(Map<String, dynamic> json) {
    myList =
        json['my_list'] != null ? new MyList.fromJson(json['my_list']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (myList != null) {
      data['my_list'] = myList!.toJson();
    }
    return data;
  }
}

class MyList {
  String? currentPage;
  List<VideoListData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  String? to;
  int? total;

  MyList(
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

  MyList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <VideoListData>[];
      json['data'].forEach((v) {
        data!.add(new VideoListData.fromJson(v));
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
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class VideoListData {
  int? videoid;
  String? videokey;
  int? userid;
  String? title;
  int? fileType;
  String? videoFiles;
  String? serverIp;
  String? description;
  String? tags;
  String? category;
  String? fileDirectory;
  String? active;
  String? dateAdded;
  String? broadcast;
  int? rating;
  String? voterIds;
  String? fileServerPath;
  String? filesThumbsPath;
  String? fileThumbsCount;
  String? duration;
  String? hasHq;
  String? maturityLevel;
  int? views;
  String? fileName;
  String? ratedBy;
  String? defaultThumb;
  int? contentType;
  String? superFeature;
  String? live;
  String? is360;
  String? projectionType;
  String? isPremium;
  String? startPublishedDate;
  String? endPublishedDate;
  String? country;
  String? datecreated;
  String? location;
  String? blockedCountries;
  String? allowedCountries;
  String? spriteCount;
  String? commentsCount;
  String? referUrl;
  String? epgUrl;
  String? dvrUrl;
  String? dvrBackupTimezone;
  String? epgDvrCatchupUrl;
  String? dvrBackupDuration;
  String? lastViewed;
  String? featured;
  String? featuredOrder;
  String? featuredDate;
  String? status;
  String? reConvStatus;
  String? convProgress;
  String? embedCode;
  int? seasonId;
  int? seriesId;
  int? sequence;
  String? isChanneHome;
  int? isAvod;
  int? isTvod;
  int? overrideDefaultMonetization;
  int? rentalHours;
  String? thumbsVersion;
  int? version;
  String? videoVersion;
  int? preOrder;
  String? deletedAt;
  String? flagged;
  int? processStatus;
  String? partnerId;
  String? epgChannelId;
  String? drmProtected;
  String? username;
  String? email;
  String? avatar;
  String? sex;
  String? avatarUrl;
  String? dob;
  String? level;
  String? usrStatus;
  String? userSessionKey;
  String? banStatus;
  String? totalPhotos;
  String? profileHits;
  String? totalVideos;
  String? subscribers;
  int? totalSubscriptions;
  String? isLive;
  String? isVerified;
  String? optInMarketing;
  String? isPartner;
  String? videoUsers;
  int? liveStatus;
  String? adId;
  String? isEp;
  List<Assets>? assets;
  String? logo;
  PortraitThumbs? portraitThumbs;
  Thumbs? thumbs;
  String? gif;
  List<String>? files;
  String? watchUrl;
  String? year;
  String? durationInSeconds;
  int? rate;
  String? trailers;
  String? favId;
  String? isFav;
  String? url;
  String? shareable;
  List<Categories>? categories;

  VideoListData(
      {this.videoid,
      this.videokey,
      this.userid,
      this.title,
      this.fileType,
      this.videoFiles,
      this.serverIp,
      this.description,
      this.tags,
      this.category,
      this.fileDirectory,
      this.active,
      this.dateAdded,
      this.broadcast,
      this.rating,
      this.voterIds,
      this.fileServerPath,
      this.filesThumbsPath,
      this.fileThumbsCount,
      this.duration,
      this.hasHq,
      this.maturityLevel,
      this.views,
      this.fileName,
      this.ratedBy,
      this.defaultThumb,
      this.contentType,
      this.superFeature,
      this.live,
      this.is360,
      this.projectionType,
      this.isPremium,
      this.startPublishedDate,
      this.endPublishedDate,
      this.country,
      this.datecreated,
      this.location,
      this.blockedCountries,
      this.allowedCountries,
      this.spriteCount,
      this.commentsCount,
      this.referUrl,
      this.epgUrl,
      this.dvrUrl,
      this.dvrBackupTimezone,
      this.epgDvrCatchupUrl,
      this.dvrBackupDuration,
      this.lastViewed,
      this.featured,
      this.featuredOrder,
      this.featuredDate,
      this.status,
      this.reConvStatus,
      this.convProgress,
      this.embedCode,
      this.seasonId,
      this.seriesId,
      this.sequence,
      this.isChanneHome,
      this.isAvod,
      this.isTvod,
      this.overrideDefaultMonetization,
      this.rentalHours,
      this.thumbsVersion,
      this.version,
      this.videoVersion,
      this.preOrder,
      this.deletedAt,
      this.flagged,
      this.processStatus,
      this.partnerId,
      this.epgChannelId,
      this.drmProtected,
      this.username,
      this.email,
      this.avatar,
      this.sex,
      this.avatarUrl,
      this.dob,
      this.level,
      this.usrStatus,
      this.userSessionKey,
      this.banStatus,
      this.totalPhotos,
      this.profileHits,
      this.totalVideos,
      this.subscribers,
      this.totalSubscriptions,
      this.isLive,
      this.isVerified,
      this.optInMarketing,
      this.isPartner,
      this.videoUsers,
      this.liveStatus,
      this.adId,
      this.isEp,
      this.assets,
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
      this.categories});

  VideoListData.fromJson(Map<String, dynamic> json) {
    videoid = json['videoid'];
    videokey = json['videokey'];
    userid = json['userid'];
    title = json['title'];
    fileType = json['file_type'];
    videoFiles = json['video_files'];
    serverIp = json['server_ip'];
    description = json['description'];
    tags = json['tags'];
    category = json['category'];
    fileDirectory = json['file_directory'];
    active = json['active'];
    dateAdded = json['date_added'];
    broadcast = json['broadcast'];
    rating = json['rating'];
    voterIds = json['voter_ids'];
    fileServerPath = json['file_server_path'];
    filesThumbsPath = json['files_thumbs_path'];
    fileThumbsCount = json['file_thumbs_count'];
    duration = json['duration'];
    hasHq = json['has_hq'];
    maturityLevel = json['maturity_level'];
    views = json['views'];
    fileName = json['file_name'];
    ratedBy = json['rated_by'];
    defaultThumb = json['default_thumb'];
    contentType = json['content_type'];
    superFeature = json['super_feature'];
    live = json['live'];
    is360 = json['is_360'];
    projectionType = json['projection_type'];
    isPremium = json['is_premium'];
    startPublishedDate = json['start_published_date'];
    endPublishedDate = json['end_published_date'];
    country = json['country'];
    datecreated = json['datecreated'];
    location = json['location'];
    blockedCountries = json['blocked_countries'];
    allowedCountries = json['allowed_countries'];
    spriteCount = json['sprite_count'];
    commentsCount = json['comments_count'];
    referUrl = json['refer_url'];
    epgUrl = json['epg_url'];
    dvrUrl = json['dvr_url'];
    dvrBackupTimezone = json['dvr_backup_timezone'];
    epgDvrCatchupUrl = json['epg_dvr_catchup_url'];
    dvrBackupDuration = json['dvr_backup_duration'];
    lastViewed = json['last_viewed'];
    featured = json['featured'];
    featuredOrder = json['featured_order'];
    featuredDate = json['featured_date'];
    status = json['status'];
    reConvStatus = json['re_conv_status'];
    convProgress = json['conv_progress'];
    embedCode = json['embed_code'];
    seasonId = json['season_id'];
    seriesId = json['series_id'];
    sequence = json['sequence'];
    isChanneHome = json['is_channeHome'];
    isAvod = json['is_avod'];
    isTvod = json['is_tvod'];
    overrideDefaultMonetization = json['override_default_monetization'];
    rentalHours = json['rental_hours'];
    thumbsVersion = json['thumbs_version'];
    version = json['version'];
    videoVersion = json['video_version'];
    preOrder = json['pre_order'];
    deletedAt = json['deleted_at'];
    flagged = json['flagged'];
    processStatus = json['process_status'];
    partnerId = json['partner_id'];
    epgChannelId = json['epg_channel_id'];
    drmProtected = json['drm_protected'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    sex = json['sex'];
    avatarUrl = json['avatar_url'];
    dob = json['dob'];
    level = json['level'];
    usrStatus = json['usr_status'];
    userSessionKey = json['user_session_key'];
    banStatus = json['ban_status'];
    totalPhotos = json['total_photos'];
    profileHits = json['profile_hits'];
    totalVideos = json['total_videos'];
    subscribers = json['subscribers'];
    totalSubscriptions = json['total_subscriptions'];
    isLive = json['is_live'];
    isVerified = json['is_verified'];
    optInMarketing = json['opt_in_marketing'];
    isPartner = json['is_partner'];
    videoUsers = json['video_users'];
    liveStatus = json['live_status'];
    adId = json['ad_id'];
    isEp = json['is_ep'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
    logo = json['logo'];
    portraitThumbs = json['portrait_thumbs'] != null
        ? new PortraitThumbs.fromJson(json['portrait_thumbs'])
        : null;
    thumbs =
        json['thumbs'] != null ? new Thumbs.fromJson(json['thumbs']) : null;
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
    shareable = json['shareable'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoid'] = videoid;
    data['videokey'] = videokey;
    data['userid'] = userid;
    data['title'] = title;
    data['file_type'] = fileType;
    data['video_files'] = videoFiles;
    data['server_ip'] = serverIp;
    data['description'] = description;
    data['tags'] = tags;
    data['category'] = category;
    data['file_directory'] = fileDirectory;
    data['active'] = active;
    data['date_added'] = dateAdded;
    data['broadcast'] = broadcast;
    data['rating'] = rating;
    data['voter_ids'] = voterIds;
    data['file_server_path'] = fileServerPath;
    data['files_thumbs_path'] = filesThumbsPath;
    data['file_thumbs_count'] = fileThumbsCount;
    data['duration'] = duration;
    data['has_hq'] = hasHq;
    data['maturity_level'] = maturityLevel;
    data['views'] = views;
    data['file_name'] = fileName;
    data['rated_by'] = ratedBy;
    data['default_thumb'] = defaultThumb;
    data['content_type'] = contentType;
    data['super_feature'] = superFeature;
    data['live'] = live;
    data['is_360'] = is360;
    data['projection_type'] = projectionType;
    data['is_premium'] = isPremium;
    data['start_published_date'] = startPublishedDate;
    data['end_published_date'] = endPublishedDate;
    data['country'] = country;
    data['datecreated'] = datecreated;
    data['location'] = location;
    data['blocked_countries'] = blockedCountries;
    data['allowed_countries'] = allowedCountries;
    data['sprite_count'] = spriteCount;
    data['comments_count'] = commentsCount;
    data['refer_url'] = referUrl;
    data['epg_url'] = epgUrl;
    data['dvr_url'] = dvrUrl;
    data['dvr_backup_timezone'] = dvrBackupTimezone;
    data['epg_dvr_catchup_url'] = epgDvrCatchupUrl;
    data['dvr_backup_duration'] = dvrBackupDuration;
    data['last_viewed'] = lastViewed;
    data['featured'] = featured;
    data['featured_order'] = featuredOrder;
    data['featured_date'] = featuredDate;
    data['status'] = status;
    data['re_conv_status'] = reConvStatus;
    data['conv_progress'] = convProgress;
    data['embed_code'] = embedCode;
    data['season_id'] = seasonId;
    data['series_id'] = seriesId;
    data['sequence'] = sequence;
    data['is_channeHome'] = isChanneHome;
    data['is_avod'] = isAvod;
    data['is_tvod'] = isTvod;
    data['override_default_monetization'] = overrideDefaultMonetization;
    data['rental_hours'] = rentalHours;
    data['thumbs_version'] = thumbsVersion;
    data['version'] = version;
    data['video_version'] = videoVersion;
    data['pre_order'] = preOrder;
    data['deleted_at'] = deletedAt;
    data['flagged'] = flagged;
    data['process_status'] = processStatus;
    data['partner_id'] = partnerId;
    data['epg_channel_id'] = epgChannelId;
    data['drm_protected'] = drmProtected;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['sex'] = sex;
    data['avatar_url'] = avatarUrl;
    data['dob'] = dob;
    data['level'] = level;
    data['usr_status'] = usrStatus;
    data['user_session_key'] = userSessionKey;
    data['ban_status'] = banStatus;
    data['total_photos'] = totalPhotos;
    data['profile_hits'] = profileHits;
    data['total_videos'] = totalVideos;
    data['subscribers'] = subscribers;
    data['total_subscriptions'] = totalSubscriptions;
    data['is_live'] = isLive;
    data['is_verified'] = isVerified;
    data['opt_in_marketing'] = optInMarketing;
    data['is_partner'] = isPartner;
    data['video_users'] = videoUsers;
    data['live_status'] = liveStatus;
    data['ad_id'] = adId;
    data['is_ep'] = isEp;
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    data['logo'] = logo;
    if (portraitThumbs != null) {
      data['portrait_thumbs'] = portraitThumbs!.toJson();
    }
    if (thumbs != null) {
      data['thumbs'] = thumbs!.toJson();
    }
    data['gif'] = gif;
    data['files'] = files;
    data['watch_url'] = watchUrl;
    data['year'] = year;
    data['duration_in_seconds'] = durationInSeconds;
    data['rate'] = rate;
    data['trailers'] = trailers;
    data['fav_id'] = favId;
    data['is_fav'] = isFav;
    data['url'] = url;
    data['shareable'] = shareable;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  String? assetId;
  String? sourceId;
  String? contentType;
  String? contentId;
  String? host;
  String? path;
  String? cacheHost;
  String? cachePath;
  String? cacheExpiry;
  String? width;
  String? height;
  String? size;
  String? type;
  String? extension;
  String? mimeType;
  String? dateAdded;
  String? dateUpdated;
  String? storage;
  String? drmProvider;
  String? drmEncoder;
  String? drmType;
  String? url;
  double? ratio;
  String? formattedSize;

  Assets(
      {this.assetId,
      this.sourceId,
      this.contentType,
      this.contentId,
      this.host,
      this.path,
      this.cacheHost,
      this.cachePath,
      this.cacheExpiry,
      this.width,
      this.height,
      this.size,
      this.type,
      this.extension,
      this.mimeType,
      this.dateAdded,
      this.dateUpdated,
      this.storage,
      this.drmProvider,
      this.drmEncoder,
      this.drmType,
      this.url,
      this.ratio,
      this.formattedSize});

  Assets.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    sourceId = json['source_id'];
    contentType = json['content_type'];
    contentId = json['content_id'];
    host = json['host'];
    path = json['path'];
    cacheHost = json['cache_host'];
    cachePath = json['cache_path'];
    cacheExpiry = json['cache_expiry'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    type = json['type'];
    extension = json['extension'];
    mimeType = json['mime_type'];
    dateAdded = json['date_added'];
    dateUpdated = json['date_updated'];
    storage = json['storage'];
    drmProvider = json['drm_provider'];
    drmEncoder = json['drm_encoder'];
    drmType = json['drm_type'];
    url = json['url'];
    ratio = json['ratio'];
    formattedSize = json['formatted_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset_id'] = assetId;
    data['source_id'] = sourceId;
    data['content_type'] = contentType;
    data['content_id'] = contentId;
    data['host'] = host;
    data['path'] = path;
    data['cache_host'] = cacheHost;
    data['cache_path'] = cachePath;
    data['cache_expiry'] = cacheExpiry;
    data['width'] = width;
    data['height'] = height;
    data['size'] = size;
    data['type'] = type;
    data['extension'] = extension;
    data['mime_type'] = mimeType;
    data['date_added'] = dateAdded;
    data['date_updated'] = dateUpdated;
    data['storage'] = storage;
    data['drm_provider'] = drmProvider;
    data['drm_encoder'] = drmEncoder;
    data['drm_type'] = drmType;
    data['url'] = url;
    data['ratio'] = ratio;
    data['formatted_size'] = formattedSize;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  Thumbs(
      {this.original,
      this.s168x105,
      this.s416x260,
      this.s632x395,
      this.s768x432,
      this.s1280x720,
      this.s1920x1080});

  Thumbs.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    s168x105 = json['168x105'];
    s416x260 = json['416x260'];
    s632x395 = json['632x395'];
    s768x432 = json['768x432'];
    s1280x720 = json['1280x720'];
    s1920x1080 = json['1920x1080'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = original;
    data['168x105'] = s168x105;
    data['416x260'] = s416x260;
    data['632x395'] = s632x395;
    data['768x432'] = s768x432;
    data['1280x720'] = s1280x720;
    data['1920x1080'] = s1920x1080;
    return data;
  }
}

class Categories {
  int? categoryId;
  int? parentId;
  String? categoryName;
  int? categoryOrder;
  String? categoryDesc;
  String? categoryThumb;
  String? featured;
  String? isdefault;
  String? navbar;
  int? isTrailer;

  Categories(
      {this.categoryId,
      this.parentId,
      this.categoryName,
      this.categoryOrder,
      this.categoryDesc,
      this.categoryThumb,
      this.featured,
      this.isdefault,
      this.navbar,
      this.isTrailer});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    parentId = json['parent_id'];
    categoryName = json['category_name'];
    categoryOrder = json['category_order'];
    categoryDesc = json['category_desc'];
    categoryThumb = json['category_thumb'];
    featured = json['featured'];
    isdefault = json['isdefault'];
    navbar = json['navbar'];
    isTrailer = json['is_trailer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_order'] = categoryOrder;
    data['category_desc'] = categoryDesc;
    data['category_thumb'] = categoryThumb;
    data['featured'] = featured;
    data['isdefault'] = isdefault;
    data['navbar'] = navbar;
    data['is_trailer'] = isTrailer;
    return data;
  }
}
