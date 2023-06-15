part of data;

abstract class BooksService {
  Future<CategoriesDto?> getCategories();

  Future<CategoriesBooksDto?> getBooksByCategories();

  Future<BooksDto?> getBooksByCategoryId({required int id, required PaginationRequestDto pagination});

  Future<BookDto?> getBookById(String id);

  Future<BooksDto?> getBooksByQuery({required SearchRequestDto request});

  Future<BooksDto?> getNewBooks();

  Future<BooksDto?> getPopularBooks();

  Future<DefaultResultDto?> changeFavorite({required String id});

  Future<DefaultResultDto?> addComment({
    required AddCommentRequestDto request,
    required String bookId,
  });

  Future<DefaultResultDto?> changeCommentLikedStatus({
    required ChangeLikeStatusRequestDto request,
  });

  Future<CommentsDto?> getBookComments({
    required GetBookCommentsRequestDto request,
  });

  Future<DefaultIntValueResultDto?> changeBookRate({
    required ChangeBookRateRequestDto request,
  });

  Future<BooksDto?> getUserFavorite();

  Future<DefaultResultDto> setUserWishes({required WishesRequestDto request});
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
  Future<BooksDto?> getPopularBooks() async {
    final popularBooksJson =
        await _appClient.getPopularBooks();
    final BooksDto genresDto = BooksDto.fromJson(popularBooksJson.data['data']);
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
    final BookDto bookDto = BookDto.fromJson(bookJson.data);
    return bookDto;
  }

  @override
  Future<BooksDto?> getBooksByCategoryId({required int id, required PaginationRequestDto pagination}) async {
    final booksJson = await _appClient.getBooksByCategoryId(id: id, pagination: pagination);
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

  @override
  Future<DefaultResultDto?> changeFavorite({required String id}) async {
    final bookJson = await _appClient.changeFavorite(id: id);
    final DefaultResultDto result =
        DefaultResultDto.fromJson(bookJson.data);
    return result;
  }

  @override
  Future<DefaultResultDto?> addComment({
    required AddCommentRequestDto request,
    required String bookId,
  }) async {
    final bookJson =
        await _appClient.addComment(request: request, bookId: bookId);
    final DefaultResultDto result = DefaultResultDto.fromJson(bookJson.data);
    return result;
  }

  @override
  Future<DefaultResultDto?> changeCommentLikedStatus({
    required ChangeLikeStatusRequestDto request,
  }) async {
    final resultJson = await _appClient.bookChangeLikeStatus(request: request);
    final DefaultResultDto result = DefaultResultDto.fromJson(resultJson.data);
    return result;
  }

  @override
  Future<CommentsDto?> getBookComments({
    required GetBookCommentsRequestDto request,
  }) async {
    final bookJson = await _appClient.getBookComments(request: request);
    final CommentsDto result = CommentsDto.fromJson(bookJson.data);
    return result;
  }

  @override
  Future<DefaultIntValueResultDto?> changeBookRate({required ChangeBookRateRequestDto request}) async {
    final rateJson = await _appClient.bookRate(request: request);
    final DefaultIntValueResultDto result = DefaultIntValueResultDto.fromJson(rateJson.data);
    return result;
  }

  @override
  Future<BooksDto?> getUserFavorite() async {
    final userFavoriteJson = await _appClient.getUserFavorite();
    final BooksDto books = BooksDto.fromJson(userFavoriteJson.data);
    return books;
  }

  @override
  Future<DefaultResultDto> setUserWishes({required WishesRequestDto request}) async {
    final wishesJson = await _appClient.saveUserWishes(request);
    final DefaultResultDto result = DefaultResultDto.fromJson(wishesJson.data);
    return result;
  }
}
