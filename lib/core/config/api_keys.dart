part of core;

abstract class ApiKeys {
  static String baseUrl = 'http://127.0.0.1:8000/api';
  static String auth = '/user/login';
  static String googleAuth = '/login/google';
  static String logout = '/user/logout';
  static String register = '/user/register';
  static String refreshToken = '/user/auth/refresh';
  static String booksByQuery = '/book/book-by-query';
  static String newBooks = '/book/new-books';
  static String bookComments = '/book/comments';
  static String rateBook = '/book/rate';
  static String bookById = '/book/book-by-id';
  static String booksByCategoryId = '/book/books-by-category-id';
  static String booksByCategories = '/book/books-by-categories';
  static String categories = '/book/categories';
  static String changeFavorite = '/book/change-favorite';
  static String userFavorite = '/user/favorite';
  static String changeCommentLikeStatus = '/book/comment/change-like-status';
  static String storeComment = '/book/store-comment';
}
