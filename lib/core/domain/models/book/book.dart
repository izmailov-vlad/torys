part of domain;

class BookModel {
  final String id;
  final String title;
  final String description;
  final int pageCount;
  final List<String> categories;
  final List<String> imageLinks;
  final List<String> authors;
  final VolumeInfoModel volumeInfo;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.authors,
    required this.categories,
    required this.imageLinks,
    required this.volumeInfo,
  });
}
