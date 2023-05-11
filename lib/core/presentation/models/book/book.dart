part of presentation;

class BookUiModel {
  final String id;
  final String title;
  final String description;
  final int pageCount;
  final List<String> categories;
  final List<String> authors;
  final VolumeInfo volumeInfo;
  final AccessInfoUiModel accessInfo;
  final bool? isFavorite;
  final List<CommentUiModel> comments;
  final int likesCount;
  final int rate;

  BookUiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.likesCount,
    required this.rate,
    required this.categories,
    required this.authors,
    required this.volumeInfo,
    required this.accessInfo,
    required this.comments,
    this.isFavorite,
  });
}
