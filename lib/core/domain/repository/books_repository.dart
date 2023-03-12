part of domain;

abstract class BooksRepository {
  Future<List<GenreModel>?> getGenres();
}
