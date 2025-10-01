import 'package:flutter/material.dart';
import 'package:movies_module/movies_module.dart';
import '../../../trending_movies/presentation/widgets/trending_movies_section.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'eMovie',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            UpcomingMoviesSectionWidget(),
            TrendingMoviesSectionWidget(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Otras Categorías de Películas...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
