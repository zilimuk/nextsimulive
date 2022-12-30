class StreamingUrl {
  String? videoKey;
  String? quality;
  int? mp4;
  int? type;
  int? width;
  int? height;
  int? bitrate;
  String? duration;
  String? size;
  String? extension;
  String? path;

  StreamingUrl(
      {this.videoKey,
      this.quality,
      this.mp4,
      this.type,
      this.width,
      this.height,
      this.bitrate,
      this.duration,
      this.size,
      this.extension,
      this.path});

  StreamingUrl.fromJson(Map<String, dynamic> json) {
    videoKey = json['video_key'];
    quality = json['quality'];
    mp4 = json['mp4'];
    type = json['type'];
    width = json['width'];
    height = json['height'];
    bitrate = json['bitrate'];
    duration = json['duration'];
    size = json['size'];
    extension = json['extension'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_key'] = this.videoKey;
    data['quality'] = this.quality;
    data['mp4'] = this.mp4;
    data['type'] = this.type;
    data['width'] = this.width;
    data['height'] = this.height;
    data['bitrate'] = this.bitrate;
    data['duration'] = this.duration;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['path'] = this.path;
    return data;
  }
}
