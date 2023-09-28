import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-view';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeLayout.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return (appProvider.isDark())
        ? Image.asset(
            'assets/images/splash_screen_dark.png',
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.cover,
          );
  }
}
