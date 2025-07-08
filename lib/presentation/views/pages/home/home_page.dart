import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/views/pages/home/widgets/pokemon_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PokemonListWidget()));
  }
}
