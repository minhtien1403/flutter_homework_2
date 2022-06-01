import 'package:flutter/material.dart';
import 'package:flutter_homework_2/model/gerne.dart';
import 'package:flutter_homework_2/services/api_services.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  List<Gerne> gernes = <Gerne>[];

  Future<void> fetchGenre() async {
    final results = await APIServices().fetchGenre();
    gernes = results as List<Gerne>;
    notifyListeners();
  }
}
