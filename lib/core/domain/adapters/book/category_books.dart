part of domain;

extension CategoryBooksExtension on CategoryBooksModel {
  CategoryBooksUIModel toUiModel() {
    return CategoryBooksUIModel(
      bookCategory: category.toUiModel(),
      books: books.map((e) => e.toUiModel()).toList(),
    );
  }
}
