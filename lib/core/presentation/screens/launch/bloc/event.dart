part of 'bloc.dart';

@freezed
class LaunchEvent with _$LaunchEvent {
  const factory LaunchEvent.checkAuth() = _CheckAuthEvent;
  const factory LaunchEvent.navigateTo(String route) = _NavigateToEvent;
}