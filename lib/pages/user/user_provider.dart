import 'package:flutter/foundation.dart';
import 'package:stressed_out/models/user.dart';
import 'package:stressed_out/pages/user/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();
  bool _isLoggedIn = false;
  User user = User();

  bool get isLoggedIn => _isLoggedIn;

  void updateIsLoggedIn(bool v) {
    _isLoggedIn = v;
    notifyListeners(); // Notifies all listeners that the data has changed
  }

  // This calls the user signup service call and update the data listeners.
  Future<void> signUp(User user) async {
    // TODO: Based on success or failure have to do basic things.
    await _userService.signUp(user);
    notifyListeners();
  }

  // This calls the user login service call and update the data listeners.
  Future<void> login(User user) async {
    // TODO: Based on success or failure have to do basic things.
    bool isSuccess = await _userService.login(user);
    updateIsLoggedIn(isSuccess);
    notifyListeners();
  }

  // This calls the user details service call and update the data listeners.
  Future<void> details(String userId) async {
    // TODO: Based on response set the user details.
    await _userService.details(userId);
    notifyListeners();
  }
}
