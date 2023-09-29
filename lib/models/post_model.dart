class PostModel {
  final String? postContent;
  final DateTime postDate;
  final String? image;

  PostModel({
    this.postContent,
    required this.postDate,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'postContent': postContent,
      'postDate': postDate.toIso8601String(),
      'image': image,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postContent: map['postContent'],
      postDate: DateTime.parse(map['postDate']),
      image: map['image'],
    );
  }
}
