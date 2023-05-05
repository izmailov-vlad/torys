part of data;

@Injectable(as: BooksRepository)
class BooksRepositoryImpl extends BooksRepository {
  final BooksService booksService;

  BooksRepositoryImpl(this.booksService);

  @override
  Future<List<CategoryModel>?> getCategories() async {
    final categories = await booksService.getCategories();
    return categories?.data
        .map<CategoryModel>((genre) => genre.toGenreModel())
        .toList();
  }

  @override
  Future<List<BookModel>?> getPopularBooks({required int userId}) async {
    final popularBooksDto = await booksService.getPopularBooks(userId: userId);
    return popularBooksDto?.items
        .map<BookModel>((book) => book.toModel())
        .toList();
  }

  @override
  Future<CategoriesBooksModel?> getBooksByCategories() async {
    final result = await booksService.getBooksByCategories();
    return result?.toModel();
  }

  @override
  Future<BookModel?> getBookById(String id) async {
    final result = await booksService.getBookById(id);
    return result?.toModel();
  }

  @override
  Future<BooksModel?> getBooksByCategoryId(int id) async {
    final booksByCategoryId = await booksService.getBooksByCategoryId(id);
    return booksByCategoryId?.toModel();
  }

  @override
  Future<BooksModel?> getBooksByQuery(
      {required SearchRequestDto request}) async {
    final booksByQuery = await booksService.getBooksByQuery(request: request);
    return booksByQuery?.toModel();
  }

  @override
  Future<BooksModel?> getNewBooks() async {
    final booksByQuery = await booksService.getNewBooks();
    return booksByQuery?.toModel();
  }
}
