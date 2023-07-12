import 'dart:async';

import 'package:advanced_arabic_mina_course/presentation%20layers/resources/assets_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/color_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/constants_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // ignore: unused_field
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssetsManager.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
