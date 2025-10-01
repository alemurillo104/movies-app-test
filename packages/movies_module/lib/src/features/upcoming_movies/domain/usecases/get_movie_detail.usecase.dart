import '../entities/movie_detail.entity.dart';
import '../repositories/movies.repository.dart';

class GetMovieDetailUseCase {
  final MoviesRepository _repository;

  const GetMovieDetailUseCase({
    required MoviesRepository repository,
  }) : _repository = repository;

  Future<MovieDetailEntity> call(int movieId) async {
    return await _repository.retrieveMovieDetail(movieId);
  }
}
