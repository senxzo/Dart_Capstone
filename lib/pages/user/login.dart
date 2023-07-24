import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stressed_out/models/user.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/pages/home_page.dart';
import 'package:stressed_out/pages/user/sign_up.dart';
import 'package:stressed_out/pages/user/user_provider.dart';
import 'package:stressed_out/utils/app_constants.dart';
import 'package:provider/provider.dart';
import '/pages/user/AuthService.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context, AuthService authService) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error if email or password is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    try {
      await authService.signInWithEmailAndPassword(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider data = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.login),
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
                Dimens.height08(),
                Align(
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      AppConstants.forgotPassword,
                    ),
                  ),
                ),
                Dimens.height08(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  )),
                  onPressed: () {
                      AuthService authService = Provider.of<AuthService>(context, listen: false);
                      _handleLogin(context, authService);
                    },
                  child: const Text(AppConstants.login),
                ),
                Text(data.isLoggedIn.toString()),
                Dimens.height16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(AppConstants.newUser),
                    Dimens.width08(),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                           builder: (context) => SignUp(authService: Provider.of<AuthService>(context, listen: false)),
                          ),
                        );
                      },
                      child: const Text(AppConstants.signUp),
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
