part of 'bloc.dart';

@freezed
class AuthorizationEvent with _$AuthorizationEvent {
  const factory AuthorizationEvent.init() = AuthorizationInitEvent;
  const factory AuthorizationEvent.auth(String email, String password) = AuthorizationAuthEvent;
  const factory AuthorizationEvent.googleAuth() = AuthorizationGoogleAuthEvent;
  const factory AuthorizationEvent.register(String name, String email, String password) = AuthorizationRegisterEvent;
  const factory AuthorizationEvent.changeScreenState(ScreenState screenState) = AuthorizationChangeScreenStateEvent;
}