import 'package:stressed_out/utils/app_constants.dart';

class User {
  final String username;
  final String email;
  final String? password;
  final String gender;
  final int stressLevel;
  final String imageUrl;
  final List<String> stressReports;

  User({
    required this.username,
    required this.email,
    this.password,
    required this.gender,
    required this.stressLevel,
    required this.imageUrl,
    required this.stressReports,
  });

  User.empty()
      : username = 'Full name',
        email = 'username@domain.com',
        password = '',
        gender = '',
        stressLevel = 0,
        imageUrl = AppUrls.defaultImageUrl,
        stressReports = [];

  // Converting User object to JSON.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'gender': gender,
      'stressLevel': stressLevel,
      'imageUrl': imageUrl,
      'stressReports': stressReports,
    };
  }

  User.fromJson(Map<String, dynamic> data)
      : username = data['username'],
        email = data['email'],
        password = data['password'],
        gender = data['gender'],
        stressLevel = data['stressLevel'],
        imageUrl = data['imageUrl'],
        stressReports = data['stressReports'];
}
