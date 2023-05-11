part of favorite_bloc;

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.init() = FavoriteInitState;
  const factory FavoriteState.fetched({required BooksUiModel books}) = FavoriteFetchedState;
  const factory FavoriteState.changeFavorite({required bool isFavorite}) = FavoriteChangeState;
  const factory FavoriteState.navigateToBook({required String bookId}) = FavoriteNavigateToBookState;
}