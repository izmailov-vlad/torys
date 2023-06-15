part of presentation;

@Freezed(makeCollectionsUnmodifiable: false)
class BooksUiModel with _$BooksUiModel {
  factory BooksUiModel({
    required final List<BookUiModel> items,
  }) = _BooksUiModel;
}