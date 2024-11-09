class Author {
  late String id;
  late String name;
  late String birthDate;
  late String biography;

  Author({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.biography,
  });

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthDate = json['birthdate'];
    biography = json['biography'];
  }

  toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['birthdate'] = birthDate;
    data['biography'] = biography;
    return data;
  }
}
