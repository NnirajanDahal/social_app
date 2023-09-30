class PostModel {
  final String? postId;
  final String? postContent;
  final DateTime postDate;
  final String? image;
  final int? likes;

  PostModel(
      {this.postId,
      this.postContent,
      required this.postDate,
      this.image,
      this.likes});

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'postContent': postContent,
      'postDate': postDate.toIso8601String(),
      'image': image,
      'likes': likes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'],
      likes: map['likes'],
      postContent: map['postContent'],
      postDate: DateTime.parse(map['postDate']),
      image: map['image'],
    );
  }
}
