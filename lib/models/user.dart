class User {
  final String? username;
  final String? email;
  final String? password;

  User({
    this.username,
    this.email,
    this.password,
  });

  User.empty()
      : username = '',
        email = '',
        password = '';

  // Converting User object to JSON.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  User.fromJson(Map<String, dynamic> data)
      : username = data['username'],
        email = data['email'],
        password = data['password'];
}
