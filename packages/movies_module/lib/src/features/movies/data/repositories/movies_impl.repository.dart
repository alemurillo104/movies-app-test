import 'package:common_module/common_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../datasources/local.datasource.dart';
import '../datasources/remote.datasource.dart';
import '../exceptions/no_connection.exception.dart';
import '../../domain/repositories/movies.repository.dart';
import '../../../movie_detail/data/models/movie_detail.model.dart';
import '../../../upcoming_movies/data/models/upcoming_movie.model.dart';
import '../../../trending_movies/data/models/trending_movie.model.dart';
import '../../../movie_detail/domain/entities/movie_detail.entity.dart';
import '../../../top_rated_movies/data/models/top_rated_movie.model.dart';
import '../../../upcoming_movies/domain/entities/upcoming_movie.entity.dart';
import '../../../trending_movies/domain/entities/trending_movie.entity.dart';
import '../../../top_rated_movies/domain/entities/top_rated_movie.entity.dart';

class MoviesImplRepository implements MoviesRepository {
  final RemoteMoviesDataSource _remoteDataSource;
  final LocalMoviesDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  MoviesImplRepository({
    required RemoteMoviesDataSource remoteDataSource,
    required LocalMoviesDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<List<UpcomingMovieEntity>> retrieveUpcomingMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.retrieveUpcomingMovies();
        final remoteMovies = response.movies;

        final models = remoteMovies
            .map(
              (e) => e as UpcomingMovieModel,
            )
            .toList();
        await _localDataSource.saveUpcomingMovies(models);

        return remoteMovies;
      } catch (e) {
        logger.d(
          'Error remoto al obtener próximos estrenos: $e. Intentando caché...',
        );
        return await _localDataSource.getUpcomingMovies();
      }
    } else {
      logger.d('Sin conexión. Obteniendo próximos estrenos desde caché...');
      try {
        return await _localDataSource.getUpcomingMovies();
      } catch (e) {
        throw NoConnectionAndNoCacheException();
      }
    }
  }

  @override
  Future<List<TrendingMovieEntity>> retrieveTopTrendMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteMovies = await _remoteDataSource.retrieveTopTrendMovies();

        final models = remoteMovies
            .map(
              (e) => e as TrendingMovieModel,
            )
            .toList();
        await _localDataSource.saveTrendingMovies(models);

        return remoteMovies;
      } catch (e) {
        logger.d(
          'Error remoto al obtener tendencias: $e. Intentando caché...',
        );
        return await _localDataSource.getTrendingMovies();
      }
    } else {
      logger.d('Sin conexión. Obteniendo tendencias desde caché...');
      try {
        return await _localDataSource.getTrendingMovies();
      } catch (e) {
        throw NoConnectionAndNoCacheException();
      }
    }
  }

  @override
  Future<List<TopRatedMovieEntity>> retrieveTopRatedMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteMovies = await _remoteDataSource.retrieveTopRatedMovies();
        final models = remoteMovies
            .map(
              (e) => e as TopRatedMovieModel,
            )
            .toList();
        await _localDataSource.saveTopRatedMovies(models);

        return remoteMovies;
      } catch (e) {
        logger.d(
          'Error remoto al obtener mejor calificadas: $e. Intentando caché...',
        );
        return await _localDataSource.getTopRatedMovies();
      }
    } else {
      logger.d('Sin conexión. Obteniendo mejor calificadas desde caché...');
      try {
        return await _localDataSource.getTopRatedMovies();
      } catch (e) {
        throw NoConnectionAndNoCacheException();
      }
    }
  }

  @override
  Future<MovieDetailEntity> retrieveMovieDetail(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteDetail = await _remoteDataSource.retrieveMovieDetail(id);

        final model = remoteDetail as MovieDetailModel;
        await _localDataSource.saveMovieDetail(id, model);

        return remoteDetail;
      } catch (e) {
        logger.d(
          'Error remoto al obtener detalle de la película $id: $e. Intentando caché...',
        );
        return await _localDataSource.getMovieDetail(id);
      }
    } else {
      logger.d(
        'Sin conexión. Obteniendo detalle de la película $id desde caché...',
      );
      try {
        return await _localDataSource.getMovieDetail(id);
      } catch (e) {
        throw NoConnectionAndNoCacheException();
      }
    }
  }
}
