import 'package:flutter/material.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/pages/user/login.dart';
import 'package:stressed_out/utils/app_constants.dart';
import '/pages/user/AuthService.dart';

class SignUp extends StatefulWidget {
  final AuthService authService; // Add this line

   SignUp({Key? key, required this.authService}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();


void _handleSignUp() async {
  String email = _emailController.text.trim();
  String password = _passwordController.text.trim();
  String fullName = _fullNameController.text.trim();

  if (email.isEmpty || password.isEmpty || fullName.isEmpty) {
    // Show error if email, password or fullName is empty
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill out all fields')),
    );
    return;
  }

  String? error = await widget.authService.signUpWithEmailAndPassword(email, password, fullName);
  if (error != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error signing up: $error')),
    );
    return;
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Login(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.signUp),
      body: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
            top: 48.0, right: 16.0, left: 16.0, bottom: 16.0),
        child: Material(
          elevation: 0.5,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                 controller: _fullNameController, 
                  keyboardType: TextInputType.name,
                  decoration: CommonComponents.getInputDecoration(
                    AppConstants.fullName,
                  ),
                ),
                Dimens.height16(),
                TextFormField(
                controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: CommonComponents.getInputDecoration(
                    AppConstants.email,
                  ),
                ),
                Dimens.height16(),
                TextFormField(
                controller: _passwordController,
                  obscureText: true,
                  decoration: CommonComponents.getInputDecoration(
                    AppConstants.password,
                  ),
                ),
                Dimens.height16(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  )),
                onPressed: _handleSignUp,
                  child: const Text(AppConstants.signUp),
                ),
                Dimens.height16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(AppConstants.alreadyAUser),
                    Dimens.width08(),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: const Text(AppConstants.login),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
