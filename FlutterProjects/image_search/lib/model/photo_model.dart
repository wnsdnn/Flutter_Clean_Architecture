class PhotoModel {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String userImageURL;

  PhotoModel({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    required this.userImageURL,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      webformatURL: json['webformatURL'],
      webformatWidth: json['webformatWidth'],
      webformatHeight: json['webformatHeight'],
      largeImageURL: json['largeImageURL'],
      imageWidth: json['imageWidth'],
      imageHeight: json['imageHeight'],
      imageSize: json['imageSize'],
      views: json['views'],
      downloads: json['downloads'],
      collections: json['collections'],
      likes: json['likes'],
      comments: json['comments'],
      user_id: json['user_id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['previewURL'] = previewURL;
    _data['previewWidth'] = previewWidth;
    _data['previewHeight'] = previewHeight;
    _data['webformatURL'] = webformatURL;
    _data['webformatWidth'] = webformatWidth;
    _data['webformatHeight'] = webformatHeight;
    _data['largeImageURL'] = largeImageURL;
    _data['imageWidth'] = imageWidth;
    _data['imageHeight'] = imageHeight;
    _data['imageSize'] = imageSize;
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['collections'] = collections;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = user_id;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }

  @override
  String toString() {
    return 'PhotoModel{id: $id}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
