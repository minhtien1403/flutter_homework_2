import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/movie.dart';

const item = Movie(
    movieName: "Doctor Strange",
    movieDescription:
        "Very good movie of mavel about doctor strange in multivers of maddness, release in july for all cinema in the world",
    thumbUrl: "assets/images/thumb.jpg");

const _movies = [item, item, item, item, item, item, item, item];

class MovieListview extends StatelessWidget {
  const MovieListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("POPULAR")),
        body: ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        return MovieItem(
          movie: _movies[index],
        );
      },
    ));
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          Image(image: AssetImage(movie.thumbUrl)),
        ],
      ),
    );
  }
}