import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/themes/app_theme.dart';
import 'package:pokedex_app/presentation/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(MainApp(showIntro: prefs.getBool('hasSeenIntro') ?? false));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.showIntro});

  final bool showIntro;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(hasSeenIntro: showIntro),
    );
  }
}
