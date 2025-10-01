import 'package:common_dependency_module/common_dependency_module.dart';
import '../../../domain/entities/trending_movie.entity.dart';
import '../../../domain/usecases/get_top_trend_movies.usecase.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTopTrendMoviesUseCase getTopTrendMoviesUseCase;

  TrendingMoviesBloc({
    required this.getTopTrendMoviesUseCase,
  }) : super(const TrendingMoviesState()) {
    on<TrendingMoviesFetched>(_onFetchTrendingMovies);
  }

  Future<void> _onFetchTrendingMovies(
    TrendingMoviesFetched event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: TrendingMoviesStatus.loading,
          message: '',
        ),
      );

      final movies = await getTopTrendMoviesUseCase.call();

      if (movies.isEmpty) {
        emit(
          state.copyWith(
            status: TrendingMoviesStatus.error,
            message: 'No hay películas en tendencia disponibles.',
            movies: [],
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: TrendingMoviesStatus.success,
            movies: movies,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: TrendingMoviesStatus.error,
          movies: [],
          message: 'Error al cargar las películas en tendencia.',
        ),
      );
    }
  }
}
