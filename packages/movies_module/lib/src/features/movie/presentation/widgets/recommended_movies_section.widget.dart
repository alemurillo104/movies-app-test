import 'package:flutter/material.dart';
import 'package:common_module/common_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import 'package:movies_module/src/navigation/modular.dart';
import 'category_filter_chip.widget.dart';
import '../blocs/recommended_movies/recommended_movies_bloc.dart';

class RecommendedMoviesSectionWidget extends StatefulWidget {
  const RecommendedMoviesSectionWidget({super.key});

  @override
  State<RecommendedMoviesSectionWidget> createState() =>
      _RecommendedMoviesSectionWidgetState();
}

const languageFilterValue = 'es';
const releaseYearValue = 1993;

class _RecommendedMoviesSectionWidgetState
    extends State<RecommendedMoviesSectionWidget> {
  final recommendedMoviesBloc =
      MoviesModularModule.injectorBloc<RecommendedMoviesBloc>();
  String? _currentLanguageFilter = languageFilterValue;
  int? _currentYearFilter;

  void _applyFilter({String? language, int? year}) {
    setState(() {
      if (language != null) {
        _currentLanguageFilter =
            (_currentLanguageFilter == language) ? null : language;
      }

      if (year != null) {
        _currentYearFilter = (_currentYearFilter == year) ? null : year;
      }
    });

    recommendedMoviesBloc.add(
      FetchAndFilterRecommendedMovies(
        filterLanguageCode: _currentLanguageFilter,
        filterReleaseYear: _currentYearFilter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => recommendedMoviesBloc
        ..add(
          const FetchAndFilterRecommendedMovies(
            filterLanguageCode: languageFilterValue,
          ),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recomendados para ti',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                CategoryFilterChipWidget(
                  label: 'En español',
                  isSelected: _currentLanguageFilter == languageFilterValue,
                  onTap: () => _applyFilter(language: languageFilterValue),
                ),
                const SizedBox(width: 8),
                CategoryFilterChipWidget(
                  label: 'Lanzadas en 1993',
                  isSelected: _currentYearFilter == releaseYearValue,
                  onTap: () => _applyFilter(year: releaseYearValue),
                ),
              ],
            ),
          ),
          BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
            builder: (context, state) {
              switch (state.status) {
                case RecommendedMoviesStatus.success:
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return PosterCardWidget(
                          movieTitle: movie.title,
                          movieVoteAverage: movie.voteAverage,
                          moviePosterPath: movie.posterPath,
                          onTap: () {},
                        );
                      },
                    ),
                  );
                case RecommendedMoviesStatus.error:
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: Text(
                        state.message ??
                            'Ocurrió un error, intente nuevamente.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );

                case RecommendedMoviesStatus.empty:
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: Text(
                        state.message ?? 'No se encontraron resultados.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                case RecommendedMoviesStatus.loading:
                default:
                  return const Padding(
                    padding: EdgeInsets.all(32),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white70,
                      ),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
