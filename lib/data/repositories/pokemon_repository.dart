import 'package:pikadart/pikadart.dart';

class PokemonRepository {
  final PokeApiClient pokeApiClient = PokeApiClient(
    cacheStrategy: MemoryCacheStrategy(ttl: const Duration(days: 1)),
  );

  Future<NamedApiResourceList> getPokemonList(int offset, int limit) async =>
      await pokeApiClient.pokemon.getPokemonList(offset, limit);
}
