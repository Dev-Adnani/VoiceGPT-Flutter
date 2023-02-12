import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voicegpt/app/constants/app.animation.dart';
import 'package:voicegpt/app/routes/app.routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAnimation.splashAnim,
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "VoiceGPT",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
