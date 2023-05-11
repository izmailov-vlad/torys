part of book_bloc;

@freezed
class BookDetailEvent with _$BookDetailEvent {
  const factory BookDetailEvent.init({required String id}) = BookInitEvent;

  const factory BookDetailEvent.read({required String id}) = BookReadEvent;

  const factory BookDetailEvent.changeFavorite({
    required String id,
  }) = BookChangeFavoriteEvent;

  const factory BookDetailEvent.addComment({
    required String comment,
    required String bookId,
  }) = BookDetailAddCommentEvent;

  const factory BookDetailEvent.changeCommentLikeStatus({
    required int commentId,
    required String bookId,
  }) = BookDetailChangeCommentLikeStatusEvent;

  const factory BookDetailEvent.changeBookRate({
    required int rate,
    required String bookId,
  }) = BookDetailChangeRateEvent;
}
