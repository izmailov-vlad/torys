part of data;

@Injectable(as: BooksRepository)
class BooksRepositoryImpl extends BooksRepository {
  final BooksService booksService;

  BooksRepositoryImpl(this.booksService);

  @override
  List<Book> getBooksByAuthor(int authorId) {
    // TODO: implement getBooksByAuthor
    throw UnimplementedError();
  }

  @override
  List<Book> getBooksByGenre() {
    // TODO: implement getBooksByGenre
    throw UnimplementedError();
  }

  @override
  List<Book> getRecommendations() {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }

  @override
  Future<void> getBooks() async {}

  @override
  Future<List<GenreModel>?> getGenres() async {
    final genres = await booksService.getGenres();
    return genres?.genres
        .map<GenreModel>((genre) => genre.toGenreModel())
        .toList();
  }
}
