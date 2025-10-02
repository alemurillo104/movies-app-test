part of 'recommended_movies_bloc.dart';

abstract class RecommendedMoviesEvent extends Equatable {
  const RecommendedMoviesEvent();

  @override
  List<Object?> get props => [];
}

class RecommendedMoviesFetched extends RecommendedMoviesEvent {
  final String? initialLanguageFilter;

  const RecommendedMoviesFetched({this.initialLanguageFilter});

  @override
  List<Object?> get props => [initialLanguageFilter];
}

class RecommendedMoviesFilterApplied extends RecommendedMoviesEvent {
  final String? language;
  final int? releaseYear;

  const RecommendedMoviesFilterApplied({
    this.language,
    this.releaseYear,
  });

  @override
  List<Object?> get props => [language, releaseYear];
}

class FetchAndFilterRecommendedMovies extends RecommendedMoviesEvent {
  final String? filterLanguageCode;
  final int? filterReleaseYear;

  const FetchAndFilterRecommendedMovies({
    this.filterLanguageCode,
    this.filterReleaseYear,
  });
}
