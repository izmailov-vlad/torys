part of book_search_bloc;

@Freezed(equal: false)
class BookSearchEvent with _$BookSearchEvent {
  const factory BookSearchEvent.findByQuery({required String query, BooksUiModel? books}) = BookSearchFindByQuery;
  const factory BookSearchEvent.eraseSearchField() = BookSearchEraseField;
  const factory BookSearchEvent.onFavoriteTap({required String bookId, required BooksUiModel books}) = BookSearchFavoriteTapEvent;
}
