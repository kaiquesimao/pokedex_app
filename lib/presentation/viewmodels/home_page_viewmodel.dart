import 'package:flutter/foundation.dart';
import 'package:pikadart/pikadart.dart';
import 'package:pokedex_app/presentation/viewmodels/pokemon_list_viewmodel.dart';

class HomePageViewModel extends ChangeNotifier {
  final PokemonListViewModel _pokemonListViewModel = PokemonListViewModel();
  List<Pokemon>? _pokemonSearchedList;

  List<Pokemon>? get pokemonSearchedList => _pokemonSearchedList;

  Future<void> handlePokemonFilter(String value) async {
    if (value.isEmpty) {
      await loadPokemons();
      return;
    }
    // this if is only necessary if the search algorithm is on the api
    // if (value.length >= 3) {
    _pokemonSearchedList = _pokemonListViewModel.searchPokemon(value);
    notifyListeners();
    // }
  }

  Future<void> loadPokemons() async {
    _pokemonSearchedList = null;
    notifyListeners();
    await _pokemonListViewModel.loadPokemonList(
      offset: 0,
      limit: 10,
      // limit: AppNumbers.pokemonListLimit,
    );
    _pokemonSearchedList = _pokemonListViewModel.pokemonList;
    notifyListeners();
  }
}
