part of 'bloc.dart';

@freezed
class AuthorizationState with _$AuthorizationState {
  const factory AuthorizationState.init() = AuthorizationInitState;

  const factory AuthorizationState.navigateToWishes() = AuthorizatioNavigateToWishesState;

  const factory AuthorizationState.authSuccess() = AuthorizationSuccessState;

  const factory AuthorizationState.googleAuthSuccess({required String url}) = AuthorizationGoogleAuthSuccessState;

  const factory AuthorizationState.registrationSuccess() = RegistrationSuccessState;

  const factory AuthorizationState.error(BaseError error) =
      AuthorizationErrorState;

  const factory AuthorizationState.changeScreenState(ScreenState screenState) = ChangeScreenState;
}

enum ScreenState {
  authorization,
  registration,
}
