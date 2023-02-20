import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.model.dart';
import 'package:triplecyber_test/modules/movies/controller/movies.controller.dart';
import 'package:triplecyber_test/modules/movies/widgets/movie.card.dart';
import 'package:triplecyber_test/routes/app.routes.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Peliculas'),
            actions: [
              IconButton(
                onPressed: controller.filterAction,
                icon: Icon(Icons.filter_alt_rounded),
                color: controller.showOnlyFavorites ? Colors.blue : Colors.grey,
              )
            ],
          ),
          body: controller.state == MoviesState.loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : RefreshIndicator(
                  onRefresh: () => controller.getMovies(),
                  child: controller.state == MoviesState.failure
                      ? const Center(
                          child: Text(
                              'Ocurrion un error inesperado, por favor intente de nuevo'),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          separatorBuilder: (_, i) => const SizedBox(height: 8),
                          itemCount: !controller.showOnlyFavorites
                              ? controller.movies.length
                              : controller.filterdMovies.length,
                          itemBuilder: (_, i) {
                            MovieModel movie = !controller.showOnlyFavorites
                                ? controller.movies[i]
                                : controller.filterdMovies[i];
                            return InkWell(
                              onTap: () => Get.toNamed(AppRoutes.MoviesDetail,
                                  arguments: movie),
                              child: MovieCard(movie: movie),
                            );
                          },
                        ),
                ),
        );
      },
    );
  }
}
