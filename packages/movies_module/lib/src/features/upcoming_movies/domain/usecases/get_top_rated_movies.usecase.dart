import '../entities/top_rated_movie.entity.dart';
import '../repositories/movies.repository.dart';

class GetTopRatedMoviesUseCase {
  final MoviesRepository _repository;

  const GetTopRatedMoviesUseCase({
    required MoviesRepository repository,
  }) : _repository = repository;

  Future<List<TopRatedMovieEntity>> call() async {
    return await _repository.retrieveTopRatedMovies();
  }
}
