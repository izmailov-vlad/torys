part of data;

@Injectable(as: BooksRepository)
class BooksRepositoryImpl extends BooksRepository {
  final BooksService booksService;

  BooksRepositoryImpl(this.booksService);

  @override
  Future<List<GenreModel>?> getGenres() async {
    final genres = await booksService.getGenres();
    return genres?.genres
        .map<GenreModel>((genre) => genre.toGenreModel())
        .toList();
  }

  @override
  Future<List<BookModel>?> getPopularBooks({required int userId}) async {
    final popularBooksDto = await booksService.getPopularBooks(userId: userId);
    return popularBooksDto?.books
        .map<BookModel>((book) => book.toBookModel())
        .toList();
  }
}
