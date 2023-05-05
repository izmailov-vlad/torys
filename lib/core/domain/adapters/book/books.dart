part of domain;

extension BooksExtension on BooksModel {
  BooksUiModel toUiModel() {
    return BooksUiModel(
      items: books.map((e) => e.toUiModel()).toList(),
    );
  }
}
