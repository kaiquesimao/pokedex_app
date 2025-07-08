import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPageView extends StatelessWidget {
  const IntroductionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Todos os Pokémons em um só lugar!",
          body:
              "Acesse uma vasta lista de pokémon de todas as gerações já feitas pela Nintendo",
          image: Center(
            child: Image.asset("assets/images/intro_1.png", height: 275.0),
          ),
        ),
        PageViewModel(
          title: "Fácil de Usar",
          body:
              "Navegue de forma intuitiva e realize tarefas com poucos toques.",
          image: Center(
            child: Image.asset("assets/images/intro_2.png", height: 275.0),
          ),
        ),
      ],
      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('hasSeenIntro', true);
      },
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        "Vamos começar!",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      back: const Icon(Icons.arrow_back),
      showBackButton: true,
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onPrimary,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
