class UserDetailModel {
  final String name;
  final String age;
  final String DOB;
  final String contact;
  final String? education;
  final String? profileImage;
  final String? coverImage;

  UserDetailModel(
      {required this.name,
      required this.age,
      required this.DOB,
      required this.contact,
      this.education,
      this.profileImage,
      this.coverImage});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'DOB': DOB,
      'contact': contact,
      'education': education,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };
  }

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
        name: json['name'],
        age: json['age'],
        DOB: json['DOB'],
        contact: json['contact'],
        education: json['education'],
        profileImage: json['profileImage'],
        coverImage: json['coverImage']);
  }
}
