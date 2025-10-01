import 'package:common_dependency_module/common_dependency_module.dart';
import '../features/home/presentation/pages/home.page.dart';
import '../features/upcoming_movies/data/datasources/remote.datasource.dart';
import '../features/upcoming_movies/domain/repositories/movies.repository.dart';
import '../features/upcoming_movies/data/repositories/movies_impl.repository.dart';
import '../features/upcoming_movies/domain/usecases/get_upcoming_movies.usecase.dart';
import '../features/upcoming_movies/domain/usecases/get_top_trend_movies.usecase.dart';
import '../features/upcoming_movies/presentation/blocs/bloc/upcoming_movies_bloc.dart';

class MoviesModularModule extends Module {
  static T injectorBloc<T extends Bloc>() => Modular.get<T>();

  @override
  void binds(Injector i) {
    i.add(RemoteMoviesDataSource.new);
    i.add<MoviesRepository>(MoviesImplRepository.new);
    i.add(GetUpcomingMoviesUseCase.new);
    i.add(GetTopTrendMoviesUseCase.new);
    i.add(UpcomingMoviesBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
