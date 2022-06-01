import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/movie.dart';
import 'package:flutter_homework_2/view/movie_list/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'movie_details_bodyview.dart';
import 'movie_details_topview.dart';

// '${APIServices.baseImageUrl}${movie.backdropPath}'

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          MovieDetailsTopView(movie: movie),
          const SizedBox(
            height: 20,
          ),
          MovieDetailsBodyView(movie: movie)
        ],
      ),
    );
  }
}
