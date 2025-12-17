class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobile: json['mobile'],
    );
  }
}
