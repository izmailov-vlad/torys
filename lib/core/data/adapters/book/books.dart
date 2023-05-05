part of data;

extension BooksExtension on BooksDto {
  BooksModel toModel() {
    return BooksModel(
      books: items.map((e) => e.toModel()).toList(),
    );
  }
}
