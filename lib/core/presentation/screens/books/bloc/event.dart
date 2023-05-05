part of book_bloc;

@freezed
class BooksEvent with _$BooksEvent {
  const factory BooksEvent.onTap({required String id}) = BooksOnTapEvent;
  const factory BooksEvent.onFavoriteTap({required String id}) = BooksOnFavoriteTapEvent;
}