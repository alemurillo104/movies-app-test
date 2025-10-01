import 'package:common_dependency_module/common_dependency_module.dart';
import '../../../../movie/domain/entities/upcoming_movie.entity.dart';
import '../../../../movie/domain/usecases/get_upcoming_movies.usecase.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;

  UpcomingMoviesBloc({
    required this.getUpcomingMoviesUseCase,
  }) : super(const UpcomingMoviesState()) {
    on<UpcomingMoviesFetched>(_onFetchUpcomingMovies);
  }

  Future<void> _onFetchUpcomingMovies(
    UpcomingMoviesFetched event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: UpcomingMoviesStatus.loading,
          message: '',
        ),
      );

      final movies = await getUpcomingMoviesUseCase.call();

      if (movies.isEmpty) {
        emit(
          state.copyWith(
            status: UpcomingMoviesStatus.error,
            message: 'No hay próximos estrenos disponibles.',
            movies: [],
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: UpcomingMoviesStatus.success,
            movies: movies,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: UpcomingMoviesStatus.error,
          movies: [],
          message: 'Error al cargar los próximos estrenos.',
        ),
      );
    }
  }
}
