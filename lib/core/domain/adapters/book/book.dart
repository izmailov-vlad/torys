part of domain;

extension BookExtension on BookModel {
  BookUiModel toUiModel() {
    return BookUiModel(
      id: id,
      title: title,
      description: description,
      pageCount: pageCount,
      categories: categories,
      authors: authors,
      volumeInfo: volumeInfo.toVolumeInfo(),
      accessInfo: accessInfo.toUiModel(),
      isFavorite: isFavorite ?? false,
      comments: comments.map((e) => e.toUiModel()).toList(),
      likesCount: likesCount,
      rate: rate,
    );
  }
}
