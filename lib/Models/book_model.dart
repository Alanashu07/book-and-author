class Book {
  late String id;
  late String title;
  late String description;
  late String publishedDate;
  late String authorId;
  late String coverPictureUrl;
  late int price;
  late int starCount;
  late List<dynamic> ratings;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureUrl,
    required this.price,
    required this.starCount,
    required this.ratings,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    publishedDate = json['publishedDate'] ?? '';
    authorId = json['authorId'] ?? '';
    coverPictureUrl = json['coverPictureURL'] ?? '';
    price = json['price'] ?? 0;
    starCount = json['starCount'] ?? 0;
    ratings = json['ratings'] ?? [];
  }

  toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['publishedDate'] = publishedDate;
    data['authorId'] = authorId;
    data['coverPictureURL'] = coverPictureUrl;
    data['price'] = price;
    data['starCount'] = starCount;
    data['ratings'] = ratings;
    return data;
  }
}
