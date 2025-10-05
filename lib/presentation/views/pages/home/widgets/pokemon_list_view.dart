import 'package:flutter/material.dart';
import 'package:pikadart/pikadart.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({super.key, required this.pokemons});

  final List<Pokemon>? pokemons;

  @override
  Widget build(BuildContext context) {
    if (pokemons == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: pokemons!.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons![index];
        final sprites = pokemon.sprites;
        final spriteUrl = sprites.frontDefault!;
        return ListTile(
          title: Text(pokemon.name),
          leading: SizedBox(
            width: 56,
            height: 56,
            child: Image.network(
              spriteUrl,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        );
      },
    );
  }
}
