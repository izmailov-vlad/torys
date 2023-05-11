part of profile_edit_bloc;

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.init() = ProfileEditInitState;
  const factory ProfileEditState.fetch({required UserUiModel user}) = ProfileEditFetchState;
  const factory ProfileEditState.navigateBackState() = ProfileEditNavigateBackState;
}
