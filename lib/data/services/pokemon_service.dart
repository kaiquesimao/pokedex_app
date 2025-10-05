import 'package:pikadart/pikadart.dart';

class PokemonService {
  final PokeApiClient _pokeApiClient = PokeApiClient(
    cacheStrategy: MemoryCacheStrategy(ttl: const Duration(days: 1)),
  );

  Future<NamedApiResourceList> getPokemonList(int offset, int limit) async =>
      await _pokeApiClient.pokemon.getPokemonList(offset, limit);

  Future<Pokemon> getPokemonByName(String name) async =>
      await _pokeApiClient.pokemon.getPokemonByName(name);

  // Future<String> getPokemonImage(String name) async => await _pokeApiClient
  //     .pokemon
  //     .getPokemonByName(name)
  //     .then((pokemon) => pokemon.sprites.frontDefault!);
}
