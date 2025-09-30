import 'package:movies_module/movies_module.dart';
import 'package:splash_module/splash_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import 'navigation.dart';

class CoreModularModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      CorePath.splash,
      child: (context) => const SplashScreenPage(),
    );
    r.module(
      CorePath.movies,
      module: MoviesModularModule(),
      transition: TransitionType.noTransition,
    );
  }
}
