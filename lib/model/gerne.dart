class Gerne {
  Gerne({required this.id, required this.name});

  int id;
  String name;

  factory Gerne.fromJson(Map<String, dynamic> json) =>
      Gerne(id: json["id"], name: json["name"]);
}
