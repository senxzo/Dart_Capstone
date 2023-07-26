import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This contains all the strings in application.
class AppConstants {
  static const String appTitle = "StressedOut?";
  static const String signUp = "Sign Up";
  static const String login = "Login";
  static const String skip = "Skip";
  static const String events = "Events";
  static const String posts = "Posts";
  static const String analyze = "Analyze";
  static const String description = "Description";
  static const String createPost = "Create Post";
  static const String createEvent = "Create Event";
  static const String email = "Email";
  static const String password = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String fullName = "Full Name";
  static const String alreadyAUser = "Already a user?";
  static const String newUser = "New user?";
  static const String requestToJoin = "Request to Join";
  static const String requestSent = "Request Sent";
  static const String settings = "Settings";
  static const String profile = "Profile";
  static const String submit = "Submit";
  static const String stressAnalyzer = "Stress Analyzer";
}

// This contains all the constant dimensions of application.
class AppDimens {
  static height04() {
    return const SizedBox(height: 4.0);
  }

  static height08() {
    return const SizedBox(height: 8.0);
  }

  static height16() {
    return const SizedBox(height: 16.0);
  }

  static height32() {
    return const SizedBox(height: 32.0);
  }

  static width08() {
    return const SizedBox(width: 8.0);
  }

  static width16() {
    return const SizedBox(width: 16.0);
  }

  static width32() {
    return const SizedBox(width: 32.0);
  }
}

// This contains all the format methods.
class FormatConstants {
  static getDateFormat() {
    return DateFormat("dd MMM yyyy hh:mm a");
  }
}

// This contains all the URLs(APIs URLs) of the application.
class AppUrls {
  // Domain of StressedOut backend.
  static const String domain = "https://localhost:8080/";

  // Below are the user API endpoints.
  static const String userSignup = "user/signup";
  static const String userLogin = "user/login";
  static const String userDetails = "user/details/id";

  // Below are the event API endpoints.
  static const String eventCreate = "event/create";
  static const String eventList = "events/id";
  static const String eventDetails = "event/details/id";

  // Below are the post API endpoints.
  static const String postCreate = "post/create";
  static const String postList = "post/id";
  static const String postDetails = "post/details/id";

  static const String defaultImageUrl =
      "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg";
}
