part of data;

abstract class BooksService {
  Future<CategoriesDto?> getCategories();

  Future<BooksDto?> getPopularBooks({required int userId});

  Future<CategoriesBooksDto?> getBooksByCategories();

  Future<BooksDto?> getBooksByCategoryId(int id);

  Future<BookDto?> getBookById(String id);

  Future<BooksDto?> getBooksByQuery({required SearchRequestDto request});

  Future<BooksDto?> getNewBooks();
}

@Injectable(as: BooksService)
class BookServiceImpl extends BooksService {
  final ApiClient _appClient;

  BookServiceImpl(this._appClient);

  @override
  Future<CategoriesDto?> getCategories() async {
    final categoriesJson = await _appClient.getCategories();
    final CategoriesDto genresDto = CategoriesDto.fromJson(categoriesJson.data);
    return genresDto;
  }

  @override
  Future<BooksDto?> getPopularBooks({required int userId}) async {
    final popularBooksJson =
        await _appClient.getMainBooksContent(userId: userId);
    final BooksDto genresDto = BooksDto.fromJson(popularBooksJson.data);
    return genresDto;
  }

  @override
  Future<CategoriesBooksDto?> getBooksByCategories() async {
    final popularBooksJson = await _appClient.getBooksByCategories();
    final CategoriesBooksDto categoryBooksDto =
        CategoriesBooksDto.fromJson(popularBooksJson.data);
    return categoryBooksDto;
  }

  @override
  Future<BookDto?> getBookById(String id) async {
    final bookJson = await _appClient.getBookById(id);
    final BookDto bookDto = BookDto.fromJson(bookJson.data['data']);
    return bookDto;
  }

  @override
  Future<BooksDto?> getBooksByCategoryId(int id) async {
    final booksJson = await _appClient.getBooksByCategoryId(id: id);
    final BooksDto booksDto = BooksDto.fromJson(booksJson.data['data']);
    return booksDto;
  }

  @override
  Future<BooksDto?> getBooksByQuery({required SearchRequestDto request}) async {
    final booksJson = await _appClient.getBooksByQuery(request: request);
    final BooksDto booksDto = BooksDto.fromJson(booksJson.data['data']);
    return booksDto;
  }

  @override
  Future<BooksDto?> getNewBooks() async {
    final booksJson = await _appClient.getNewBooks();
    final BooksDto booksDto = BooksDto.fromJson(booksJson.data['data']);
    return booksDto;
  }
}
