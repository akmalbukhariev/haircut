
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/pages/choose_service_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset("images/app_logo.png", width: 100, height: 100,),
          nextScreen: ChooseServicePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.scale,
          backgroundColor: const Color.fromRGBO(78, 65, 71, 1))
    );
  }
}