part of profile_edit_bloc;

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.init() = ProfileEditInitEvent;

  const factory ProfileEditEvent.save({
    required String name,
    required String email,
  }) = ProfileEditSaveEvent;
}
