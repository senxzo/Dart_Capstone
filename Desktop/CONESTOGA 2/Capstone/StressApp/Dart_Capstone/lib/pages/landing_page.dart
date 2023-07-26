import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:provider/provider.dart';
import 'package:stressed_out/pages/user/login.dart';
import 'package:stressed_out/pages/user/sign_up.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

import '/pages/user/AuthService.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Are you stressed?',
      'Share It With Friends!',
      'Join Events Around You!'
    ];
    final subTitles = [
      'Analyze the stress level using our stress analyzer',
      'Share your thoughts with your friends',
      'You can join hundreds of  exciting events near you',
    ];

    return Column(
      children: [
        Flexible(
          child: IntroductionSlider(
            items: [
              IntroductionSliderItem(
                title: Text(
                  titles[0],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade900, fontSize: 32.0),
                ),
                backgroundColor: Colors.white,
                subtitle: Text(
                  subTitles[0],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade500, fontSize: 16.0),
                ),
              ),
              IntroductionSliderItem(
                title: Text(
                  titles[1],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade900, fontSize: 32.0),
                ),
                backgroundColor: Colors.white,
                subtitle: Text(
                  subTitles[1],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade500, fontSize: 16.0),
                ),
              ),
              IntroductionSliderItem(
                title: Text(
                  titles[2],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade900, fontSize: 32.0),
                ),
                backgroundColor: Colors.white,
                subtitle: Text(
                  subTitles[2],
                  style: TextStyle(
                      color: AppColors.primarySwatch.shade500, fontSize: 16.0),
                ),
              ),
            ],
            done: Done(
              child: const Icon(Icons.done),
              home: SignUp(
                  authService:
                      Provider.of<AuthService>(context, listen: false)),
            ),
            next: const Next(child: Icon(Icons.arrow_forward_ios_outlined)),
            back: const Back(child: Icon(Icons.arrow_back_ios_outlined)),
            dotIndicator: DotIndicator(
              selectedColor: AppColors.primarySwatch.shade900,
              unselectedColor: AppColors.primarySwatch.shade100,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: const Text(AppConstants.login),
            ),
            const SizedBox(width: 60.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(
                      authService:
                          Provider.of<AuthService>(context, listen: false),
                    ),
                  ),
                );
              },
              child: const Text(AppConstants.signUp),
            ),
          ],
        ),
        const SizedBox(height: 60.0),
      ],
    );
  }
}
