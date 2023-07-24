import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stressed_out/models/user.dart';
import 'package:stressed_out/utils/app_constants.dart';

// This contains all the user network actions.
class UserService {
  // This creates a user by calling the user signup endpoint.
  Future<String> signUp(User user) async {
    const url = AppUrls.domain + AppUrls.userSignup;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return 'User registered successfully!';
      } else {
        return 'There was a problem registering user. Please try again later';
      }
    } catch (error) {
      print('User signup error: $error');
      return 'Unable to register user';
    }
  }

  // This verifies a user by calling the user login endpoint.
  Future<bool> login(User user) async {
    const url = AppUrls.domain + AppUrls.userLogin;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // 'User logged in successfully!';
        return true;
      } else {
        // 'There was a problem logging in user. Please try again later';
        return true; // should be false here.
      }
    } catch (error) {
      print('User login error: $error');
      // 'Unable to logging in user';
      return true; // should be false here.
    }
  }

  // This creates a user by calling the user details endpoint.
  // TODO: Change the string return type to User object.
  Future<User> details(String userId) async {
    const url = AppUrls.domain + AppUrls.userDetails;
    User user = User.empty();

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({'id': userId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // TODO: Convert response to User object.
        return user;
      } else {
        //return 'There was a problem fetching user details. Please try again later';
        return user;
      }
    } catch (error) {
      print('User details error: $error');
      return user;
      //return 'Unable to fetch user details';
    }
  }
}
