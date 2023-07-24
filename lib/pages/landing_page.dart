import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:stressed_out/pages/user/sign_up.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text(AppConstants.skip),
              ),
              Expanded(
                child: OnBoardingSlider(
                  skipTextButton: Container(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(AppConstants.skip),
                      /*AppConstants.skip,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryAccentColor,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                  /*Text(
                    AppConstants.skip,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryAccentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),*/
                  trailing: Text(
                    AppConstants.signUp,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryAccentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailingFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  totalPage: 3,
                  headerBackgroundColor: AppColors.primaryAccentColor,
                  background: [
                    Image.asset(
                      'assets/images/slide_1.png',
                      height: 200,
                    ),
                    Image.asset(
                      'assets/images/slide_2.png',
                      height: 200,
                    ),
                    Image.asset(
                      'assets/images/slide_3.png',
                      height: 200,
                    ),
                  ],
                  speed: 2,
                  pageBodies: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /*SizedBox(
                            height: 480,
                          ),*/
                          Text(
                            'On your way...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryAccentColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'to find the perfect looking Onboarding for your app?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /* SizedBox(
                            height: 480,
                          ),*/
                          Text(
                            'You’ve reached your destination.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryAccentColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sliding with animation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /*SizedBox(
                            height: 480,
                          ),*/
                          Text(
                            'Start now!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryAccentColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Where everything is possible and customize your onboarding.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
