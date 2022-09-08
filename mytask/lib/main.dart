import 'package:flutter/material.dart';
import 'package:mytask/views/home_view.dart';
import 'package:mytask/views/splash.dart';
import 'package:mytask/widgets/platform_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return PlatformController.getAppWidget(context, SplashView());
  }
}

