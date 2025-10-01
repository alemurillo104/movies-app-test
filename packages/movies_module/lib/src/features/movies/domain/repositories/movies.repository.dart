import '../../../movie_detail/domain/entities/movie_detail.entity.dart';
import '../../../trending_movies/domain/entities/trending_movie.entity.dart';
import '../../../upcoming_movies/domain/entities/upcoming_movie.entity.dart';
import '../../../top_rated_movies/domain/entities/top_rated_movie.entity.dart';

abstract class MoviesRepository {
  Future<List<UpcomingMovieEntity>> retrieveUpcomingMovies();
  Future<List<TrendingMovieEntity>> retrieveTopTrendMovies();
  Future<List<TopRatedMovieEntity>> retrieveTopRatedMovies();
  Future<MovieDetailEntity> retrieveMovieDetail(int id);
}
