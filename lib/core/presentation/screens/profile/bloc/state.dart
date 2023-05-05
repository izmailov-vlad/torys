part of 'bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.init() = ProfileInitState;
  const factory ProfileState.fetched({required UserUiModel user}) = FetchedState;
  const factory ProfileState.logout() = LogoutState;
}
