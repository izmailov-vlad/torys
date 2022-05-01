import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';
part 'event.freezed.dart';

@freezed
class AuthorizationEvent with _$AuthorizationEvent {
  const factory AuthorizationEvent.changeScreenType() = ChangeScreenType;
  const factory AuthorizationEvent.requestFocusOnInput(
      InputType requestedInput) = RequestFocusOnInput;
  const factory AuthorizationEvent.onForgotPasswordPressed() =
      OnForgotPasswordPressed;
  const factory AuthorizationEvent.onAcceptButtonPressed(
      String email, String name, String password) = OnAcceptButtonPressed;
  const factory AuthorizationEvent.checkUser() = CheckUser;
}
