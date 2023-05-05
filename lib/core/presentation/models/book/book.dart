part of presentation;

class BookUiModel {
  final String id;
  final String title;
  final String description;
  final int pageCount;
  final List<String> categories;
  final List<String> authors;
  final List<String> imageLinks;
  final VolumeInfo volumeInfo;

  BookUiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.categories,
    required this.authors,
    required this.imageLinks,
    required this.volumeInfo,
  });
}
