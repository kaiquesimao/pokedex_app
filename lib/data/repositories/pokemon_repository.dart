import 'package:pikadart/pikadart.dart';
import 'package:pokedex_app/data/services/pokemon_service.dart';
import 'dart:developer' as developer;

class PokemonRepository {
  final PokemonService _pokemonService = PokemonService();

  Future<NamedApiResourceList> getPokemonList({
    required int offset,
    required int limit,
  }) async {
    try {
      return await _pokemonService.getPokemonList(offset, limit);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<Pokemon> getPokemonByName({required String name}) async {
    try {
      return await _pokemonService.getPokemonByName(name);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }
}
