class CategoryVideos {
  int? currentPage;
  List<Data>? data;
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

  CategoryVideos(
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

  CategoryVideos.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
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

class Data {
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
  List<String>? portraitThumbs;
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
  Quality? quality;
  String? interval;
  String? priceTag;
  bool? showPremiumBadge;
  bool? canPreOrder;
  String? availabilityDate;
  String? contentTypeLabel;

  Data(
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
      this.priceTag,
      this.showPremiumBadge,
      this.canPreOrder,
      this.availabilityDate,
      this.contentTypeLabel});

  Data.fromJson(Map<String, dynamic> json) {
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
    shareable = json['shareable'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    quality =
        json['quality'] != null ? Quality.fromJson(json['quality']) : null;
    interval = json['interval'];
    priceTag = json['price_tag'];
    showPremiumBadge = json['show_premium_badge'];
    canPreOrder = json['can_pre_order'];
    availabilityDate = json['availability_date'];
    contentTypeLabel = json['content_type_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoid'] = videoid;
    data['videokey'] = videokey;
    data['video_password'] = videoPassword;
    data['video_users'] = videoUsers;
    data['username'] = username;
    data['userid'] = userid;
    data['partner_id'] = partnerId;
    data['maturity_level'] = maturityLevel;
    data['title'] = title;
    data['file_name'] = fileName;
    data['file_type'] = fileType;
    data['description'] = description;
    data['tags'] = tags;
    data['category'] = category;
    data['category_parents'] = categoryParents;
    data['broadcast'] = broadcast;
    data['location'] = location;
    data['datecreated'] = datecreated;
    data['country'] = country;
    data['blocked_countries'] = blockedCountries;
    data['allowed_countries'] = allowedCountries;
    data['sprite_count'] = spriteCount;
    data['season_id'] = seasonId;
    data['series_id'] = seriesId;
    data['sequence'] = sequence;
    data['allow_embedding'] = allowEmbedding;
    data['rating'] = rating;
    data['rated_by'] = ratedBy;
    data['voter_ids'] = voterIds;
    data['featured'] = featured;
    data['featured_order'] = featuredOrder;
    data['featured_date'] = featuredDate;
    data['featured_description'] = featuredDescription;
    data['allow_rating'] = allowRating;
    data['allow_comments'] = allowComments;
    data['comments_count'] = commentsCount;
    data['last_commented'] = lastCommented;
    data['active'] = active;
    data['favourite_count'] = favouriteCount;
    data['playlist_count'] = playlistCount;
    data['views'] = views;
    data['last_viewed'] = lastViewed;
    data['date_added'] = dateAdded;
    data['flagged'] = flagged;
    data['duration'] = duration;
    data['status'] = status;
    data['failed_reason'] = failedReason;
    data['default_thumb'] = defaultThumb;
    data['aspect_ratio'] = aspectRatio;
    data['embed_code'] = embedCode;
    data['refer_url'] = referUrl;
    data['downloads'] = downloads;
    data['uploader_ip'] = uploaderIp;
    data['mass_embed_status'] = massEmbedStatus;
    data['unique_embed_code'] = uniqueEmbedCode;
    data['remote_play_url'] = remotePlayUrl;
    data['video_files'] = videoFiles;
    data['server_ip'] = serverIp;
    data['file_server_path'] = fileServerPath;
    data['file_directory'] = fileDirectory;
    data['files_thumbs_path'] = filesThumbsPath;
    data['file_thumbs_count'] = fileThumbsCount;
    data['has_hq'] = hasHq;
    data['filegrp_size'] = filegrpSize;
    data['process_status'] = processStatus;
    data['video_version'] = videoVersion;
    data['extras'] = extras;
    data['subscription_email'] = subscriptionEmail;
    data['thumbs_version'] = thumbsVersion;
    data['re_conv_status'] = reConvStatus;
    data['conv_progress'] = convProgress;
    data['is_premium'] = isPremium;
    data['override_default_monetization'] = overrideDefaultMonetization;
    data['credits_required'] = creditsRequired;
    data['rental_hours'] = rentalHours;
    data['premium_cid'] = premiumCid;
    data['in_editor_pick'] = inEditorPick;
    data['has_subs'] = hasSubs;
    data['total_subs'] = totalSubs;
    data['last_sub_num'] = lastSubNum;
    data['live'] = live;
    data['udp_live'] = udpLive;
    data['force_hls_http_url'] = forceHlsHttpUrl;
    data['start_published_date'] = startPublishedDate;
    data['end_published_date'] = endPublishedDate;
    data['has_sprite'] = hasSprite;
    data['version'] = version;
    data['has_resulotion'] = hasResulotion;
    data['aws_service_id'] = awsServiceId;
    data['aws_cdn'] = awsCdn;
    data['aws_thumb_path'] = awsThumbPath;
    data['license_by'] = licenseBy;
    data['is_channeHome'] = isChanneHome;
    data['content_type'] = contentType;
    data['super_feature'] = superFeature;
    data['is_avod'] = isAvod;
    data['is_tvod'] = isTvod;
    data['pre_order'] = preOrder;
    data['live_status'] = liveStatus;
    data['deleted_at'] = deletedAt;
    data['is_360'] = is360;
    data['projection_type'] = projectionType;
    data['epg_channel_id'] = epgChannelId;
    data['drm_protected'] = drmProtected;
    data['epg_url'] = epgUrl;
    data['content_language'] = contentLanguage;
    data['dvr_url'] = dvrUrl;
    data['dvr_backup_timezone'] = dvrBackupTimezone;
    data['dvr_backup_duration'] = dvrBackupDuration;
    data['epg_dvr_catchup_url'] = epgDvrCatchupUrl;
    data['logo'] = logo;
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
    if (quality != null) {
      data['quality'] = quality!.toJson();
    }
    data['interval'] = interval;
    data['price_tag'] = priceTag;
    data['show_premium_badge'] = showPremiumBadge;
    data['can_pre_order'] = canPreOrder;
    data['availability_date'] = availabilityDate;
    data['content_type_label'] = contentTypeLabel;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hd'] = hd;
    data['uhd'] = uhd;
    return data;
  }
}
