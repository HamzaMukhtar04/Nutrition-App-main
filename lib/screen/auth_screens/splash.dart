import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'package:recipe/screen/Introscreen/intro_screen.dart';
import 'package:recipe/screen/auth_screens/auth_gate/auth_gate.dart';
import 'package:recipe/screen/utiles/consts/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  /// Decide which screen to open after splash
  Widget _getNextScreen() {
   final box = Hive.box('mybox'); 
    bool isFirstTime = box.get('isFirstTime', defaultValue: true);

    if (isFirstTime) {
      return const IntroScreen();
    } else {
      return const AuthGate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/abblack.png',
      ),
      title: Text(
        'Mobile Nutrition',
        style: GoogleFonts.bebasNeue(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
      backgroundColor: background,
      showLoader: true,
      loaderColor: Colors.red,
      navigator: _getNextScreen(), 
      durationInSeconds: 3,
    );
  }
}
