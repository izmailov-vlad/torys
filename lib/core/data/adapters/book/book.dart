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
      volumeInfo: volumeInfo.toModel(),
      accessInfo: accessInfo.toModel(),
      isFavorite: isFavorite,
      comments: comments?.map((e) => e.toModel()).toList() ?? [],
      likesCount: likesCount ?? 0,
      rate: rate ?? 0,
    );
  }
}
