part of 'bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = ProfileLoad;
  const factory ProfileEvent.logout() = ProfileLogout;
  const factory ProfileEvent.takePhoto() = ProfileTakePhoto;
  const factory ProfileEvent.updatePhoto({
    required String photoPath,
    required String photoName,
}) = ProfileUpdatePhoto;
  const factory ProfileEvent.delete() = ProfileDelete;
}
