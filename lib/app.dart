import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_theme.dart';
import 'package:lesson_1/screens/home_screen.dart';

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace UI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
