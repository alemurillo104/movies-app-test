import 'package:flutter/material.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../widgets/logo.widget.dart';
import '../../../navigation/navigation.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);

    _opacityAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) _goToHomePage();
    });

    Future.delayed(const Duration(seconds: 2), () => _controller.forward());
  }

  _goToHomePage() {
    logger.d('going to home page');
    Modular.to.navigate(SplashDestination.home);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color(0xFF000000),
        Color(0xFF6A0707),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: gradient,
        ),
        child: Center(
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: const LogoWidget(),
          ),
        ),
      ),
    );
  }
}
