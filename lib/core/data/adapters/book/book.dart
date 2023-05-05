part of data;

extension BookExtension on BookDto {
  BookModel toModel() {
    return BookModel(
      id: id,
      title: volumeInfo.title,
      description: volumeInfo.description ?? '',
      pageCount: volumeInfo.pageCount ?? 0,
      authors: volumeInfo.authors ?? [],
      categories: volumeInfo.categories ?? [],
      imageLinks: volumeInfo.imageLinks != null
          ? [volumeInfo.imageLinks!.smallThumbnail]
          : [],
      volumeInfo: volumeInfo.toModel(),
    );
  }
}
