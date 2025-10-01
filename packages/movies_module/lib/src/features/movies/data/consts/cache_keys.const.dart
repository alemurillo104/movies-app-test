class CacheKeys {
  static const String trendingMovies = 'TRENDING_MOVIES_CACHE';
  static const String topRatedMovies = 'TOP_RATED_MOVIES_CACHE';
  static const String upcomingMovies = 'UPCOMING_MOVIES_CACHE';
  static String movieDetail(int id) => 'MOVIE_DETAIL_CACHE_$id';
}
