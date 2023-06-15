part of take_photo_bloc;

@freezed
class TakePhotoEvent with _$TakePhotoEvent {
  factory TakePhotoEvent.init() = TakePhotoInitEvent;

  factory TakePhotoEvent.savePhoto({
    required String photoPath,
    required String photoName,
  }) = TakePhotoSaveEvent;
}
