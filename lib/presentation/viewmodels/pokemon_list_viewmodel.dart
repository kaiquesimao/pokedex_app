import 'package:pikadart/pikadart.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import '../../core/utils/error_handler.dart';

class PokemonListViewModel {
  List<Pokemon>? _pokemonList;
  String _errorMessage = '';
  bool _isLoading = false;

  List<Pokemon>? get pokemonList => _pokemonList;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> loadPokemonList({int offset = 0, int limit = 10}) async {
    _isLoading = true;
    _errorMessage = '';

    try {
      final pokemons = await PokemonRepository().getPokemonList(
        offset: offset,
        limit: limit,
      );
      _pokemonList = await Future.wait(
        pokemons.results
            .map((pokemon) => getPokemonDetails(pokemon.name))
            .toList(),
      );
    } catch (e) {
      _errorMessage = ErrorHandler.getErrorMessage(e);
    } finally {
      _isLoading = false;
    }
  }

  Future<Pokemon> getPokemonDetails(String name) async {
    return PokemonRepository().getPokemonByName(name: name);
  }

  List<Pokemon>? searchPokemon(String pokemonName) {
    return _pokemonList
        ?.where(
          (pokemon) =>
              pokemon.name.toLowerCase().contains(pokemonName.toLowerCase()),
        )
        .toList();
  }
}
