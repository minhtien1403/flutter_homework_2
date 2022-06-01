import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/movie.dart';
import 'package:flutter_homework_2/services/api_services.dart';
import 'package:flutter_homework_2/view/movie_details_view.dart';

class MovieListViewItem extends StatelessWidget {
  MovieListViewItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  // "$baseImageUrl${movie.posterPath}"
  // "assets/images/movie_placeholder.png"
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomListtile(movie: movie),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailsView(movie: movie)));
      },
    );
  }
}

class CustomListtile extends StatelessWidget {
  const CustomListtile({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: "${APIServices.baseImageUrl}${movie.posterPath}",
          imageBuilder: (context, imageProvider) => Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight)
            ),
          ),
          placeholder: (context, url) => Container(
            width: 120,
            height: 180,
            child: Image.asset("assets/images/movie_placeholder.png"),
          ),),
          const SizedBox(width: 10,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10,),
              Text(
                movie.overview,
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