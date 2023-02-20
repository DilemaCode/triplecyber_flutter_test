import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/widgets/subtitle.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.model.dart';

// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie});
  MovieModel movie;
  @override
  Widget build(BuildContext context) {
    double size = Get.width / 7;
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff22242b),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(size / 2)),
            child: Text(
              word,
              style: TextStyle(
                fontSize: 22,
                color: Get.theme.backgroundColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SubTilte(text: movie.title!)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    movie.isFavorite!
                        ? const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        : const Icon(Icons.star_border),
                    const SizedBox(height: 5),
                    Text('${movie.voteAverage}/10'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String get word =>
      movie.title!.split(" ").take(2).map((w) => w[0]).toList().join('');
}
