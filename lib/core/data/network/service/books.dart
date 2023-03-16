part of data;

abstract class BooksService {
  Future<GenresDto?> getGenres();

  Future<BooksDto?> getPopularBooks({required int userId});
}

@Injectable(as: BooksService)
class BookServiceImpl extends BooksService {
  final AppClient appClient;

  BookServiceImpl(this.appClient);

  @override
  Future<GenresDto?> getGenres() async {
    final genresJson = await appClient.getGenres();
    final GenresDto genresDto = GenresDto.fromJson(genresJson);
    return genresDto;
  }

  @override
  Future<BooksDto?> getPopularBooks({required int userId}) async {
    final popularBooksJson = await appClient.getPopularBooks(userId: userId);
    final BooksDto genresDto = BooksDto.fromJson(popularBooksJson);
    return genresDto;
  }
}
