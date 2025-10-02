import 'package:common_dependency_module/common_dependency_module.dart';
import '../../../domain/entities/trending_movie.entity.dart';
import '../../../domain/usecases/get_movie_detail.usecase.dart';
import '../../../domain/usecases/get_top_trend_movies.usecase.dart';

part 'recommended_movies_event.dart';
part 'recommended_movies_state.dart';

const int _recommendationsLimit = 6;

class RecommendedMoviesBloc
    extends Bloc<RecommendedMoviesEvent, RecommendedMoviesState> {
  final GetTopTrendMoviesUseCase _getTopTrendMoviesUseCase;
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  RecommendedMoviesBloc({
    required GetTopTrendMoviesUseCase getTopTrendMoviesUseCase,
    required GetMovieDetailUseCase getMovieDetailUseCase,
  })  : _getTopTrendMoviesUseCase = getTopTrendMoviesUseCase,
        _getMovieDetailUseCase = getMovieDetailUseCase,
        super(
          const RecommendedMoviesState(),
        ) {
    on<FetchAndFilterRecommendedMovies>(_onFetchAndFilter);
  }

  Future<void> _onFetchAndFilter(
    FetchAndFilterRecommendedMovies event,
    Emitter<RecommendedMoviesState> emit,
  ) async {
    emit(state.copyWith(status: RecommendedMoviesStatus.loading));

    try {
      final trendingMovies = await _getTopTrendMoviesUseCase.call();

      List<TrendingMovieEntity> filteredList = [];

      for (var movie in trendingMovies) {
        try {
          final detail = await _getMovieDetailUseCase.call(movie.id);

          bool matchesLanguage = true;
          bool matchesYear = true;

          if (event.filterLanguageCode != null) {
            matchesLanguage = detail.spokenLanguages.any(
              (lang) => lang.iso6391 == event.filterLanguageCode,
            );
          }

          if (event.filterReleaseYear != null) {
            final releaseYear = DateTime.tryParse(detail.releaseDate)?.year;
            matchesYear = releaseYear == event.filterReleaseYear;
          }

          if (matchesLanguage && matchesYear) {
            filteredList.add(movie);
          }
        } catch (detailError) {
          logger.d(
            'Error al obtener detalle o filtrar película ${movie.id}: $detailError. Saltando.',
          );
        }
      }
      if (filteredList.isEmpty) {
        emit(
          state.copyWith(
            status: RecommendedMoviesStatus.empty,
          ),
        );
        return;
      }

      final moviesfilteredList =
          filteredList.take(_recommendationsLimit).toList();

      emit(
        state.copyWith(
          status: RecommendedMoviesStatus.success,
          movies: moviesfilteredList,
        ),
      );
    } catch (e) {
      logger.d('Error general en RecommendedMoviesBloc: $e');
      emit(
        state.copyWith(
          status: RecommendedMoviesStatus.error,
          message: 'Fallo al cargar o filtrar películas: $e',
        ),
      );
    }
  }
}
