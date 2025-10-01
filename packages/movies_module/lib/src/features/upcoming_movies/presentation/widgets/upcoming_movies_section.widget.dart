import 'package:flutter/material.dart';
import 'package:common_module/common_module.dart';
import 'package:movies_module/movies_module.dart';
import 'package:common_dependency_module/common_dependency_module.dart';
import '../blocs/bloc/upcoming_movies_bloc.dart';

class UpcomingMoviesSectionWidget extends StatelessWidget {
  const UpcomingMoviesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesModularModule.injectorBloc<UpcomingMoviesBloc>()
            ..add(
              const UpcomingMoviesFetched(),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Próximos estrenos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
            builder: (context, state) {
              switch (state.status) {
                case UpcomingMoviesStatus.success:
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return PosterCardWidget(
                          movieTitle: movie.title,
                          movieVoteAverage: movie.voteAverage,
                          moviePosterPath: movie.posterPath,
                          onTap: () {
                            logger.d(movie.id);
                          },
                        );
                      },
                    ),
                  );
                case UpcomingMoviesStatus.error:
                  return SizedBox(
                    height: 250,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state.message!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  );
                case UpcomingMoviesStatus.loading:
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
