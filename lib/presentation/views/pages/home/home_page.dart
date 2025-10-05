import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/viewmodels/home_page_viewmodel.dart';
import 'package:pokedex_app/presentation/views/pages/home/widgets/pokemon_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  final HomePageViewModel _homePageViewModel = HomePageViewModel();

  @override
  void initState() {
    super.initState();
    _homePageViewModel.loadPokemons();
  }

  @override
  void dispose() {
    searchController.dispose();
    _homePageViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _homePageViewModel,
      builder: (context, _) {
        return SafeArea(
          // minimum: const EdgeInsets.all(10),
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Procurar Pokémon...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (value) {
                    _homePageViewModel.handlePokemonFilter(value);
                  },
                ),
                Expanded(
                  child: PokemonListWidget(
                    pokemons: _homePageViewModel.pokemonSearchedList,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
