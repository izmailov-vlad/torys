part of domain;

abstract class BooksRepository {
  Future<List<GenreModel>?> getGenres();
  Future<List<BookModel>?> getPopularBooks({required int userId});
}
