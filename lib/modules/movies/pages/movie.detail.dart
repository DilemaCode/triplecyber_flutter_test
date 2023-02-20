import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/common/config.dart';
import 'package:triplecyber_test/modules/movies/controller/movies.controller.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.model.dart';

class MoviesDetailPage extends StatefulWidget {
  const MoviesDetailPage({super.key});

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  MovieModel movie = Get.arguments;

  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = movie.isFavorite!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * .3,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage('${AppConfig.IMAGE_URL}${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title!,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              MoviesController.instance
                                  .addToFavorites(movie.id!);
                              setState(() {
                                isFavorite = movie.isFavorite!;
                              });
                            },
                            child: isFavorite
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.star_border,
                                    size: 30,
                                  ),
                          ),
                          SizedBox(height: 5),
                          Text('${movie.voteAverage}/10'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    movie.overview!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
