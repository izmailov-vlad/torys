part of domain;

extension GenreExtension on GenreModel {
  Genre toGenre() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
