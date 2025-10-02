import 'package:common_dependency_module/common_dependency_module.dart';
import '../../../domain/entities/movie_detail.entity.dart';
import '../../../domain/usecases/get_movie_detail.usecase.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  MovieDetailBloc({
    required GetMovieDetailUseCase getMovieDetailUseCase,
  })  : _getMovieDetailUseCase = getMovieDetailUseCase,
        super(const MovieDetailState()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
  }

  Future<void> _onFetchMovieDetail(
    FetchMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MovieDetailStatus.loading,
        detail: null,
      ),
    );

    try {
      final detail = await _getMovieDetailUseCase.call(event.movieId);

      emit(
        state.copyWith(
          status: MovieDetailStatus.success,
          detail: detail,
          message: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MovieDetailStatus.error,
          message: 'Fallo al cargar el detalle de la película: $e',
          detail: null,
        ),
      );
    }
  }
}
