part of book_bloc;

@freezed
class BooksEvent with _$BooksEvent {
  const factory BooksEvent.fetch({
    required int id,
    BooksUiModel? books,
  }) = BooksFetchEvent;

  const factory BooksEvent.onTap({required String id}) = BooksOnTapEvent;

  const factory BooksEvent.updateBook({
    required BookUiModel book,
    required BooksUiModel books,
  }) = BooksUpdateBookEvent;

  const factory BooksEvent.onFavoriteTap(
      {required String id,
      required BooksUiModel books}) = BooksOnFavoriteTapEvent;
}
