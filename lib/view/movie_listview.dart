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
            return MovieListViewItem(
              movie: _movies[index],
            );
          },
        ));
  }
}

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          Image(image: AssetImage(movie.thumbUrl)),
          const SizedBox(width: 10,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10,),
              Text(
                movie.movieDescription,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ],
      ),
    );
  }
}
