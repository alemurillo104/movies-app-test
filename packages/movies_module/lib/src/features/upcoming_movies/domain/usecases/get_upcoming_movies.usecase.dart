import '../entities/upcoming_movie.entity.dart';
import '../../../movies/domain/repositories/movies.repository.dart';

class GetUpcomingMoviesUseCase {
  final MoviesRepository _repository;

  const GetUpcomingMoviesUseCase({
    required MoviesRepository repository,
  }) : _repository = repository;

  Future<List<UpcomingMovieEntity>> call() async {
    return await _repository.retrieveUpcomingMovies();
  }
}
