part of domain;

abstract class BooksRepository {
  Future<List<CategoryModel>?> getCategories();

  Future<List<BookModel>?> getPopularBooks({required int userId});

  Future<CategoriesBooksModel?> getBooksByCategories();

  Future<BookModel?> getBookById(String id);

  Future<BooksModel?> getBooksByCategoryId(int id);

  Future<BooksModel?> getBooksByQuery({required SearchRequestDto request});

  Future<BooksModel?> getNewBooks();

  Future<bool?> changeBookFavorite({required String id});

  Future<bool?> changeBookLikeStatus({
    required ChangeLikeStatusRequestDto request,
  });

  Future<bool?> addComment({
    required AddCommentRequestDto request,
    required String bookId,
  });

  Future<List<CommentModel>?> getBookComments({
    required GetBookCommentsRequestDto request,
  });

  Future<int?> rateBook({
    required ChangeBookRateRequestDto request,
  });

  Future<BooksModel?> getUserFavorite();
}
