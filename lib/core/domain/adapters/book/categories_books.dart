part of domain;

extension BooksByCategoriesExtension on CategoriesBooksModel {
  CategoriesBooksUIModel toUiModel() {
    return CategoriesBooksUIModel(
      categoriesBooks: categoriesBooks.map((e) => e.toUiModel()).toList(),
    );
  }
}
