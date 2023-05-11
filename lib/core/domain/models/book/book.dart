part of domain;

class BookModel {
  final String id;
  final String title;
  final String description;
  final int pageCount;
  final List<String> categories;
  final List<String> authors;
  final VolumeInfoModel volumeInfo;
  final AccessInfoModel accessInfo;
  final bool? isFavorite;
  final List<CommentModel> comments;
  final int likesCount;
  final int rate;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.authors,
    required this.likesCount,
    required this.categories,
    required this.volumeInfo,
    required this.accessInfo,
    required this.comments,
    required this.rate,
    this.isFavorite,
  });
}
