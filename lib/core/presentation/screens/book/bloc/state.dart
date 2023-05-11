part of book_bloc;

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState.init() = BookDetailInitState;
  const factory BookDetailState.fetch({required BookUiModel book}) = BookDetailFetchState;
  const factory BookDetailState.changeFavorite({required bool isFavorite}) = BookDetailChangeFavoriteState;
  const factory BookDetailState.changeComments({required List<CommentUiModel> comment}) = BookDetailCommentsState;
  const factory BookDetailState.changeRate({required int rate}) = BookDetailRateState;
  const factory BookDetailState.error(BaseError error) = ErrorState;
}