import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:torys/core/presentation/router/bloc/bloc.dart';
import 'package:torys/core/presentation/router/bloc/event.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';

import 'event.dart';

typedef Authorization = Stream<AuthorizationState>;

@Injectable()
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final RouterEventSink _routerEventSink;

  AuthorizationBloc(
    this._routerEventSink,
  ) : super(
          AuthorizationState(),
        ) {
    add(AuthorizationEvent.checkUser());
  }

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) =>
      event.when(
          checkUser: _checkUser,
          onAcceptButtonPressed: _onAcceptButtonPressed,
          requestFocusOnInput: _requestFocusOnInput,
          onForgotPasswordPressed: _onForgotPasswordPressed,
          changeScreenType: _changeScreenType);

  Authorization _checkUser() async* {
    yield state.copyWith(authorizationStatus: AuthorizationStatus.loaded);
  }

  Authorization _onAcceptButtonPressed(String email, String password) async* {
    if (email.isEmpty || password.isEmpty) {
      yield state.copyWith(inputDataStatus: InputDataStatus.invalid);
      return;
    }

    _routerEventSink.add(RouterEvent.toMain());
  }

  Authorization _onForgotPasswordPressed() async* {
    yield state.copyWith(
      inputDataStatus: InputDataStatus.valid,
      screenType: ScreenType.registration,
    );
  }

  Authorization _requestFocusOnInput(InputType requestedInput) async* {
    yield state.copyWith(
      activeInput: requestedInput,
    );
  }

  Authorization _changeScreenType() async* {
    if (state.screenType == ScreenType.authorization) {
      yield state.copyWith(screenType: ScreenType.registration);
    } else {
      yield state.copyWith(screenType: ScreenType.authorization);
    }
  }
}
