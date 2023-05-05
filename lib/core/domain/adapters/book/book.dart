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
      imageLinks: imageLinks,
      volumeInfo: volumeInfo.toVolumeInfo(),
    );
  }
}