part of 'bloc.dart';

@freezed
class LaunchState with _$LaunchState {
  const factory LaunchState.init() = InitState;
  const factory LaunchState.navigateTo(NavigateToRoute route) = NavigateToState;
}

enum NavigateToRoute {
  auth,
  main
}