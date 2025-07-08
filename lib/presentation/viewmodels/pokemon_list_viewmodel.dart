import 'package:pikadart/pikadart.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import '../../core/utils/error_handler.dart';

class PokemonListViewModel {
  List<NamedApiResource> _pokemonList = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<NamedApiResource> get pokemonList => _pokemonList;
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
      _pokemonList = pokemons.results;
    } catch (e) {
      _errorMessage = ErrorHandler.getErrorMessage(e);
    } finally {
      _isLoading = false;
    }
  }
}
