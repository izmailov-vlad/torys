part of favorite_bloc;

@Freezed(equal: false)
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.init() = FavoriteInitState;
  const factory FavoriteState.loading() = FavoriteLoadingState;
  const factory FavoriteState.empty() = FavoriteEmptyState;
  const factory FavoriteState.fetched({required BooksUiModel books}) = FavoriteFetchedState;
  const factory FavoriteState.changeFavorite({required bool isFavorite}) = FavoriteChangeState;
  const factory FavoriteState.navigateToBook({required String bookId}) = FavoriteNavigateToBookState;
}