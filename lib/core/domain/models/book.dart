part of domain;

class BookModel {
  final int id;
  final String author;
  final String image;
  final String title;
  final double rate;

  BookModel({
    required this.id,
    required this.author,
    required this.image,
    required this.title,
    required this.rate,
  });
}
