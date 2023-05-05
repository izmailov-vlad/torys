part of domain;

abstract class BooksRepository {
  Future<List<CategoryModel>?> getCategories();
  Future<List<BookModel>?> getPopularBooks({required int userId});
  Future<CategoriesBooksModel?> getBooksByCategories();
  Future<BookModel?> getBookById(String id);
  Future<BooksModel?> getBooksByCategoryId(int id);
  Future<BooksModel?> getBooksByQuery({required SearchRequestDto request});
  Future<BooksModel?> getNewBooks();
}
