part of data;

extension CategoriesBooksExtension on CategoriesBooksDto {
  CategoriesBooksModel toModel() {
    return CategoriesBooksModel(
      categoriesBooks: categoriesBooks.map((e) => e.toModel()).toList(),
    );
  }
}
