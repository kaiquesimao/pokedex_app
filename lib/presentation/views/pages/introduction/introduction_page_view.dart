import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pokedex_app/presentation/viewmodels/introduction_page_viewmodel.dart';

class IntroductionPageView extends StatelessWidget {
  const IntroductionPageView({super.key});

  static final _viewModel = IntroductionViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: _viewModel.pages
            .map(
              (page) => PageViewModel(
                title: page.title,
                body: page.body,
                image: Center(child: Image.asset(page.image, height: 275.0)),
                decoration: _getOnboardingPageDecoration(context),
              ),
            )
            .toList(),
        onDone: _viewModel.onDone,
        onSkip: _viewModel.onDone,
        showSkipButton: true,
        next: const Icon(Icons.arrow_forward),
        done: const Text(
          "Vamos começar!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        back: const Icon(Icons.arrow_back),
        skip: const Icon(Icons.skip_next),
        showBackButton: true,
        dotsDecorator: _getDotsDecorator(context),
      ),
    );
  }

  PageDecoration _getOnboardingPageDecoration(BuildContext context) {
    return PageDecoration(
      titleTextStyle: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      bodyTextStyle: Theme.of(context).textTheme.bodyLarge!,
      imagePadding: const EdgeInsets.all(20),
    );
  }

  DotsDecorator _getDotsDecorator(BuildContext context) {
    return DotsDecorator(
      size: const Size.square(10.0),
      activeSize: const Size(20.0, 10.0),
      activeColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.onPrimary,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}
