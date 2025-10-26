import 'package:cv_box/feature/auth/core/presntation/pages/onBoarding/on_boarding_page.dart';
import 'package:flutter/material.dart';

import '../presentation/theme/app_theme.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      home: const OnBoardingPage()
    );
  }
}