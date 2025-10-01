import 'package:common_module/common_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../features/home/presentation/pages/home.page.dart';
import '../features/movies/data/datasources/local.datasource.dart';
import '../features/movies/data/datasources/remote.datasource.dart';
import '../features/movies/domain/repositories/movies.repository.dart';
import '../features/movies/data/repositories/movies_impl.repository.dart';
import '../features/movie_detail/domain/usecases/get_movie_detail.usecase.dart';
import '../features/upcoming_movies/domain/usecases/get_upcoming_movies.usecase.dart';
import '../features/trending_movies/domain/usecases/get_top_trend_movies.usecase.dart';
import '../features/upcoming_movies/presentation/blocs/bloc/upcoming_movies_bloc.dart';
import '../features/trending_movies/presentation/blocs/bloc/trending_movies_bloc.dart';
import '../features/top_rated_movies/domain/usecases/get_top_rated_movies.usecase.dart';

late SharedPreferences _sharedPreferencesInstance;
bool _sharedPreferencesInitialized = false;

class MoviesModularModule extends Module {
  static T injectorBloc<T extends Bloc>() => Modular.get<T>();

  static Future<void> initializeSharedPreferences() async {
    _sharedPreferencesInstance = await SharedPreferences.getInstance();
    _sharedPreferencesInitialized = true;
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<SharedPreferences>(() {
      if (!_sharedPreferencesInitialized) {
        throw Exception('SharedPreferences no ha sido inicializado.');
      }
      return _sharedPreferencesInstance;
    });

    i.add<Connectivity>(() => Connectivity());
    i.add<NetworkInfo>(NetworkInfoImpl.new);
    i.add(RemoteMoviesDataSource.new);
    i.add(LocalMoviesDataSource.new);
    i.add<MoviesRepository>(MoviesImplRepository.new);
    i.add(GetUpcomingMoviesUseCase.new);
    i.add(GetTopTrendMoviesUseCase.new);
    i.add(GetTopRatedMoviesUseCase.new);
    i.add(GetMovieDetailUseCase.new);
    i.add(UpcomingMoviesBloc.new);
    i.add(TrendingMoviesBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
