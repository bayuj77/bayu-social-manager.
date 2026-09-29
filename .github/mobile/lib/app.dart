import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'features/splash/splash_screen.dart';

class BayuSocialApp extends StatelessWidget {
  const BayuSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
