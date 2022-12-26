class MediaMetaModel {
  double width, height;
  String type, url;

  MediaMetaModel({
    this.height = 0,
    this.width = 0,
    this.type = "",
    this.url = "",
  });

  static MediaMetaModel fromMap(Map<String, dynamic> map) {
    double width, height;
    String type, url;

    width = map['width']?.toDouble() ?? 0.0;
    height = map['height']?.toDouble() ?? 0.0;
    type = map['type']?.toString() ?? "";
    url = map['url']?.toString() ?? "";

    return MediaMetaModel(
      width: width,
      height: height,
      type: type,
      url: url,
    );
  }

  void updateFromMap(Map<String, dynamic> map) {
    width = map['width']?.toDouble() ?? 0.0;
    height = map['height']?.toDouble() ?? 0.0;
    type = map['type']?.toString() ?? "";
    url = map['url']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "width" : width,
      "height" : height,
      "type" : type,
      "url" : url,
    };
  }
  double getHeight(double width){
    return ((width * this.height)/this.width);
  }
}