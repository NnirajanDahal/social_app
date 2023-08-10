class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  final String? dob;
  final String? gender;
  final String? skills;
  final String? summary;
  final String? languages;
  final bool? maritalStatus;
  final String? profileImage;
  final String? coverImage;
  final String? education;
  final int? contactInfo;
  final String? hobbies;
  final String? workExperience;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.dob,
    this.gender,
    this.skills,
    this.summary,
    this.contactInfo,
    this.coverImage,
    this.profileImage,
    this.education,
    this.hobbies,
    this.languages,
    this.maritalStatus,
    this.workExperience,
  });

  // Convert CV data to a Map
  Map<String?, dynamic> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'dob': dob,
      'gender': gender,
      'skill': skills,
      'summary': summary,
      'contactinfo': contactInfo,
      'coverimage': coverImage,
      'profileimage': profileImage,
      'education': education,
      'hobbies': hobbies,
      'languages': languages,
      'maritalstatus': maritalStatus,
      'workexperience': workExperience,
    };
  }

  // Create a CVModel instance from a Map
  factory UserModel.fromMap(Map<String?, dynamic> map) {
    return UserModel(
      firstName: map['firstname'],
      lastName: map['lastname'],
      email: map['email'],
      password: map['password'],
      dob: map['dob'],
      gender: map['gender'],
      skills: map['skill'],
      summary: map['summary'],
      contactInfo: map['contactinfo'],
      coverImage: map['coverimage'],
      profileImage: map['profileimage'],
      education: map['education'],
      hobbies: map['hobbies'],
      languages: map['languages'],
      maritalStatus: map['maritalstatus'],
      workExperience: map['workexperience'],
    );
  }
}
