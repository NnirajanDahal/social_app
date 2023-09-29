class UserModel {
  final String userId;
  final String email;
  final String password;

  UserModel({
    required this.userId,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'userID': userId,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userID'],
      email: json['email'],
      password: json['password'],
    );
  }
}
