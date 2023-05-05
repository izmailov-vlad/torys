part of data;

extension GenreExtension on CategoryDto {
  CategoryModel toGenreModel() {
    return CategoryModel(
      id: id,
      name: name,
    );
  }
}
