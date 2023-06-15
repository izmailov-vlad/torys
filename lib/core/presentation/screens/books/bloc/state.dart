part of book_bloc;

@Freezed(equal: false)
class BooksState with _$BooksState {
  const factory BooksState.init() = BooksInitState;

  const factory BooksState.fetched({required BooksUiModel books}) =
      BooksFetchedState;

  const factory BooksState.navigateToBook({required String book}) =
      NavigateToBookState;

  const factory BooksState.loading() = BooksLoadingState;

  const factory BooksState.error({required BaseError error}) = BooksErrorState;
}
