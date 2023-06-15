part of presentation;

@freezed
class BookUiModel with _$BookUiModel {
  factory BookUiModel({
    required String id,
    required String title,
    required String description,
    required int pageCount,
    required int likesCount,
    required int rate,
    required List<String> categories,
    required List<String> authors,
    required VolumeInfo volumeInfo,
    required AccessInfoUiModel accessInfo,
    required List<CommentUiModel> comments,
    required bool isFavorite,
  }) = _BookUiModel;
}
