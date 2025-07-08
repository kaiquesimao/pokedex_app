import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/viewmodels/pokemon_list_viewmodel.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  final PokemonListViewModel _pokemonListViewModel = PokemonListViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _pokemonListViewModel.loadPokemonList(offset: 0, limit: 10),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar Pokémons: ${snapshot.error}'),
          );
        }

        return ListView.builder(
          itemCount: _pokemonListViewModel.pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = _pokemonListViewModel.pokemonList[index];
            return ListTile(title: Text(pokemon.name));
          },
        );
      },
    );
  }
}
