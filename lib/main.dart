import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/themes/app_theme.dart';
import 'package:pokedex_app/presentation/views/pages/home/home_page.dart';
import 'package:pokedex_app/presentation/views/pages/introduction/introduction_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(MainApp(hasSeenIntro: prefs.getBool('hasSeenIntro') ?? false));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.hasSeenIntro});

  final bool hasSeenIntro;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: hasSeenIntro ? const HomePage() : const IntroductionPageView(),
    );
  }
}
