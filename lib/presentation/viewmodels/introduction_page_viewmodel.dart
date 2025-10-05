import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/images.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/domain/entities/introduction_model.dart';
import 'package:pokedex_app/presentation/views/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionViewModel {
  final List<IntroductionModel> _pages = [
    IntroductionModel(
      title: 'Todos os Pokémon em um só lugar!',
      body:
          'Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo',
      image: AppImages.intro_1,
    ),
    IntroductionModel(
      title: 'Mantenha sua Pokédex atualizada',
      body:
          'Cadastre-se e mantenha seu perfil, Pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.',
      image: AppImages.intro_2,
    ),
    IntroductionModel(
      title: 'Está pronto para essa aventura?',
      body:
          'Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!',
      image: AppImages.intro_3,
    ),
  ];

  List<IntroductionModel> get pages => _pages;

  void onDone(BuildContext context) async {
    final navigator = Navigator.of(context);

    final prefs = SharedPreferencesAsync();
    await prefs.setBool(SharedPrefKeys.hasSeenIntro.name, true);

    navigator.pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
