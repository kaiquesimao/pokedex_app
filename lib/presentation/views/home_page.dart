import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/views/introduction/introduction_page_view.dart';
import 'package:pokedex_app/presentation/views/pokemon_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.hasSeenIntro});

  final bool hasSeenIntro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !hasSeenIntro
          ? const IntroductionPageView()
          : const PokemonListWidget(),
    );
  }
}
