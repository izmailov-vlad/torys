part of take_photo_bloc;

@freezed
class TakePhotoState with _$TakePhotoState {
  factory TakePhotoState.init() = TakePhotoInitState;
  factory TakePhotoState.fetched() = TakePhotoFetchedState;
  factory TakePhotoState.navigateBack() = TakePhotoNavigateBackState;
}