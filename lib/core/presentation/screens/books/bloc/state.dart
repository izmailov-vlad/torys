part of book_bloc;

@freezed
class BooksState with _$BooksState {
  const factory BooksState.init() = BooksInitState;
  const factory BooksState.navigateToBook({required String book}) = NavigateToBookState;
}