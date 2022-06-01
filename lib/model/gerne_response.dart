import 'package:flutter_homework_2/model/gerne.dart';

class GerneResponse {
  GerneResponse({required this.gerne});

  List<Gerne> gerne;

  factory GerneResponse.fromJson(Map<String, dynamic> json) => GerneResponse(
        gerne: List<Gerne>.from(json["genres"].map((x) => Gerne.fromJson(x))),
      );
}
