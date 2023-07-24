import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:stressed_out/pages/user/sign_up.dart';
import 'package:provider/provider.dart';
import '/pages/user/AuthService.dart';


class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Page 1"),
          backgroundColor: Colors.redAccent[100],
        ),
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Page 2"),
          backgroundColor: Colors.greenAccent[100],
        ),
        IntroductionSliderItem(
          logo: FlutterLogo(),
          title: Text("Page 3"),
          backgroundColor: Colors.blueAccent[100],
        ),
      ],
      done: Done(
        child: Icon(Icons.done),
    home: SignUp(authService: Provider.of<AuthService>(context, listen: false)),

      ),
      next: Next(child: Icon(Icons.arrow_forward)),
      back: Back(child: Icon(Icons.arrow_back)),
      dotIndicator: DotIndicator(),
    );
  }
}
