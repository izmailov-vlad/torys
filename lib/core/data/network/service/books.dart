part of data;

abstract class BooksService {
  Future<GenresDto?> getGenres();

  List<Book> getBooksByGenre();

  List<Book> getBooksByAuthor(Author author);

  List<Book> getRecommendations();
}

@Injectable(as: BooksService)
class BookServiceImpl extends BooksService {
  final AppClient appClient;

  BookServiceImpl(this.appClient);

  @override
  List<Book> getBooksByAuthor(Author author) {
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
  Future<GenresDto?> getGenres() async {
    final genresJson = await appClient.getGenres();
    final GenresDto genresDto = GenresDto.fromJson(genresJson);
    return genresDto;
  }
}
