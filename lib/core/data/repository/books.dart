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
  Future<List<BookModel>?> getPopularBooks() async {
    final popularBooksDto = await booksService.getPopularBooks();
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
  Future<BooksModel?> getBooksByCategoryId(
      {required int id, required PaginationRequestDto pagination}) async {
    final booksByCategoryId =
        await booksService.getBooksByCategoryId(id: id, pagination: pagination);
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

  @override
  Future<bool?> changeBookFavorite({required String id}) async {
    final book = await booksService.changeFavorite(id: id);
    return book?.success;
  }

  @override
  Future<bool?> addComment(
      {required AddCommentRequestDto request, required String bookId}) async {
    final book =
        await booksService.addComment(bookId: bookId, request: request);
    return book?.success;
  }

  @override
  Future<List<CommentModel>?> getBookComments(
      {required GetBookCommentsRequestDto request}) async {
    final comments = await booksService.getBookComments(request: request);
    return comments?.data.map((e) => e.toModel()).toList();
  }

  @override
  Future<bool?> changeBookLikeStatus({
    required ChangeLikeStatusRequestDto request,
  }) async {
    final result =
        await booksService.changeCommentLikedStatus(request: request);
    return result?.success;
  }

  @override
  Future<int?> rateBook({required ChangeBookRateRequestDto request}) async {
    final result = await booksService.changeBookRate(request: request);
    return result?.value;
  }

  @override
  Future<BooksModel?> getUserFavorite() async {
    final result = await booksService.getUserFavorite();
    return result?.toModel();
  }

  @override
  Future<bool?> saveUserWishes({required WishesRequestDto request}) async {
    final result = await booksService.setUserWishes(request: request);
    return result.success;
  }
}
