part of favorite_bloc;

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.init() = FavoriteInitEvent;
  const factory FavoriteEvent.onBookTap({required String id}) = FavoriteOnBookTapEvent;
  const factory FavoriteEvent.onFavoriteTap({required String id, required BooksUiModel books}) = FavoriteOnTapEvent;
}