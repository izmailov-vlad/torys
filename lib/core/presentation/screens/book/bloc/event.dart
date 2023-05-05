part of book_bloc;

@freezed
class BookDetailEvent with _$BookDetailEvent {
  const factory BookDetailEvent.read({required String id}) = BookReadEvent;

}