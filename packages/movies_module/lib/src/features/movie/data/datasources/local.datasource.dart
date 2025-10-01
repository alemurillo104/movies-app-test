import 'dart:convert';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../consts/cache_keys.const.dart';
import '../models/movie_detail.model.dart';
import '../exceptions/cache.exception.dart';
import '../models/upcoming_movie.model.dart';
import '../models/trending_movie.model.dart';
import '../models/top_rated_movie.model.dart';
import '../../domain/entities/movie_detail.entity.dart';
import '../../domain/entities/upcoming_movie.entity.dart';
import '../../domain/entities/trending_movie.entity.dart';
import '../../domain/entities/top_rated_movie.entity.dart';

class LocalMoviesDataSource {
  final SharedPreferences sharedPreferences;

  LocalMoviesDataSource({required this.sharedPreferences});

  Future<void> saveTrendingMovies(List<TrendingMovieModel> movies) async {
    final List<Map<String, dynamic>> jsonList =
        movies.map((movie) => movie.toJson()).toList();

    await sharedPreferences.setString(
      CacheKeys.trendingMovies,
      json.encode(jsonList),
    );
  }

  Future<List<TrendingMovieEntity>> getTrendingMovies() async {
    final String? jsonString =
        sharedPreferences.getString(CacheKeys.trendingMovies);

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) =>
              TrendingMovieModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw CacheException('No hay datos de Trending Movies en caché.');
  }

  Future<void> saveTopRatedMovies(List<TopRatedMovieModel> movies) async {
    final List<Map<String, dynamic>> jsonList =
        movies.map((movie) => movie.toJson()).toList();

    await sharedPreferences.setString(
      CacheKeys.topRatedMovies,
      json.encode(jsonList),
    );
  }

  Future<List<TopRatedMovieEntity>> getTopRatedMovies() async {
    final String? jsonString =
        sharedPreferences.getString(CacheKeys.topRatedMovies);

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) =>
              TopRatedMovieModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw CacheException('No hay datos de Top Rated Movies en caché.');
  }

  Future<void> saveUpcomingMovies(List<UpcomingMovieModel> movies) async {
    final List<Map<String, dynamic>> jsonList =
        movies.map((movie) => movie.toJson()).toList();
    await sharedPreferences.setString(
      CacheKeys.upcomingMovies,
      json.encode(jsonList),
    );
  }

  Future<List<UpcomingMovieEntity>> getUpcomingMovies() async {
    final String? jsonString =
        sharedPreferences.getString(CacheKeys.upcomingMovies);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) =>
              UpcomingMovieModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw CacheException('No hay datos de Upcoming Movies en caché.');
  }

  Future<void> saveMovieDetail(int id, MovieDetailModel detail) async {
    await sharedPreferences.setString(
      CacheKeys.movieDetail(id),
      json.encode(detail.toJson()),
    );
  }

  Future<MovieDetailEntity> getMovieDetail(int id) async {
    final String? jsonString =
        sharedPreferences.getString(CacheKeys.movieDetail(id));
    if (jsonString != null) {
      return MovieDetailModel.fromJson(
          json.decode(jsonString) as Map<String, dynamic>);
    }
    throw CacheException('No hay detalle de la película $id en caché.');
  }
}
