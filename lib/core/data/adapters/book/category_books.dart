part of data;

extension CategoryBooksExtension on CategoryBooksDto {
  CategoryBooksModel toModel() {
    return CategoryBooksModel(
      books: books.items.map((e) => e.toModel()).toList(),
      category: category.toGenreModel(),
    );
  }
}
