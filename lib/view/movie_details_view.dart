import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/movie.dart';

import '../services/api_services.dart';

// '${APIServices.baseImageUrl}${movie.backdropPath}'

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie details", style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${APIServices.baseImageUrl}${movie.backdropPath}'),
                    fit: BoxFit.fill)),
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: width - 80),
                child: Text(
                  '${movie.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Text(
                  '${movie.voteAverage}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 5,)
            ],
          )
        ],
      ),
    );
  }
}
