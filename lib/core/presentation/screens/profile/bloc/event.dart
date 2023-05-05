part of 'bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = ProfileLoad;
  const factory ProfileEvent.logout() = ProfileLogout;
}
