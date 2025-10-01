import '../entities/upcoming_movie.entity.dart';

abstract class MoviesRepository {
  Future<List<UpcomingMovieEntity>> retrieveUpcomingMovies();
}
