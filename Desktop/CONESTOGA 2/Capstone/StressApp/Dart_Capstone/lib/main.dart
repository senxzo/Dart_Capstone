import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stressed_out/pages/event/event_provider.dart';
import 'package:stressed_out/pages/home_page.dart';
import 'package:stressed_out/pages/landing_page.dart';
import 'package:stressed_out/pages/post/post_provider.dart';
import 'package:stressed_out/pages/user/login.dart';
import 'package:stressed_out/pages/user/sign_up.dart';
import 'package:stressed_out/pages/user/user_provider.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stressed_out/firebase_options.dart';
import 'package:stressed_out/pages/user/AuthService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingPage(),
          '/login': (context) => const Login(),
          '/signup': (context) => SignUp(
                authService: Provider.of<AuthService>(context, listen: false),
              ),
        },
        theme: ThemeData(
          primarySwatch: AppColors.primarySwatch,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  // This code is written for testing purposes.
  getPage(context) {
    UserProvider data = Provider.of<UserProvider>(context, listen: true);

    if (data.isLoggedIn) {
      return HomePage();
    }

    return LandingPage();
  }
}
