class VideoModel {
  int? id;
  String? title;
  String? path;
  int? userId;
  String? extension;
  String? thumbnail;
  int? isActive;

  VideoModel({
    this.id,
    this.title,
    this.path,
    this.userId,
    this.extension,
    this.thumbnail,
    this.isActive,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      path: json['path'],
      userId: json['user_id'],
      extension: json['extension'],
      thumbnail: json['thumbnail'],
      isActive: json['is_active'],
    );
  }
}
