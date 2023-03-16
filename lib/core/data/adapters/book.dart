part of data;

extension BookExtension on BookDto {
  BookModel toBookModel() {
    return BookModel(
      id: id,
      author: author,
      image: image,
      title: title,
      rate: rate,
    );
  }
}
