import '../entities/trending_movie.entity.dart';
import '../../../movies/domain/repositories/movies.repository.dart';

class GetTopTrendMoviesUseCase {
  final MoviesRepository _repository;

  const GetTopTrendMoviesUseCase({
    required MoviesRepository repository,
  }) : _repository = repository;

  Future<List<TrendingMovieEntity>> call() async {
    return await _repository.retrieveTopTrendMovies();
  }
}
