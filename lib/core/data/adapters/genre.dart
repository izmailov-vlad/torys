part of data;

extension GenreExtension on GenreDto {
  GenreModel toGenreModel() {
    return GenreModel(
      id: id,
      name: name,
    );
  }
}
