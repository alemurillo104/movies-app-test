import 'package:flutter/material.dart';
import 'package:common_module/common_module.dart';
import 'package:movies_module/movies_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../blocs/trending_movies/trending_movies_bloc.dart';

class TrendingMoviesSectionWidget extends StatelessWidget {
  const TrendingMoviesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesModularModule.injectorBloc<TrendingMoviesBloc>()
            ..add(
              const TrendingMoviesFetched(),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Tendencia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
            builder: (context, state) {
              switch (state.status) {
                case TrendingMoviesStatus.success:
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return PosterCardWidget(
                          movieTitle: movie.title,
                          movieVoteAverage: movie.voteAverage,
                          moviePosterPath: movie.posterPath,
                          onTap: () {
                            Modular.to.pushNamed(
                              './movie-detail',
                              arguments: movie.id,
                            );
                          },
                        );
                      },
                    ),
                  );
                case TrendingMoviesStatus.error:
                  return SizedBox(
                    height: 250,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          state.message!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  );
                case TrendingMoviesStatus.loading:
                  return const SizedBox(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white70,
                      ),
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
