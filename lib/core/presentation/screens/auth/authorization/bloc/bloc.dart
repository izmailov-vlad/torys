import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../utils/app_logger.dart';
import '../../../../presentation.dart';

part 'state.dart';

part 'event.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<AuthorizationState>;

@injectable
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final LogInUseCase _logInUseCase;
  final RegisterUseCase _registerUseCase;
  final GoogleLoginUseCase _googleLoginUseCase;
  late final GoogleSignIn _googleSignIn;
  final List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  AuthorizationBloc(
    this._logInUseCase,
    this._registerUseCase,
    this._googleLoginUseCase,
  ) : super(const AuthorizationInitState()) {
    on<AuthorizationInitEvent>(_onInit);
    on<AuthorizationAuthEvent>(_onAuth);
    on<AuthorizationGoogleAuthEvent>(_onGoogleAuth);
    on<AuthorizationRegisterEvent>(_onRegister);
    on<AuthorizationChangeScreenStateEvent>(_onChangeScreen);
  }

  Future<void> _onInit(AuthorizationInitEvent event, _Emit emit) async {
    _googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
  }

  Future<void> _onRegister(
    AuthorizationRegisterEvent event,
    _Emit emit,
  ) async {
    try {
      final registerResult = await _registerUseCase(
        RegisterParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      if (registerResult != null) {
        emit(const RegistrationSuccessState());
      }
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onGoogleAuth(
    AuthorizationGoogleAuthEvent event,
    _Emit emit,
  ) async {
    try {
      // final account = await _googleSignIn.signIn();
      // AppLogger.log(message: account.toString());
      final result = await _googleLoginUseCase(const NoParams());
      if (result == null) return;
      emit(AuthorizationState.googleAuthSuccess(url: result.url));

    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onAuth(AuthorizationAuthEvent event, _Emit emit) async {
    try {
      final authResult = await _logInUseCase(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );
      if (authResult != null && authResult.success) {
        emit(const AuthorizationSuccessState());
      }
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(AuthorizationErrorState(error));
        },
      );
    }
  }

  Future<void> _onChangeScreen(
    AuthorizationChangeScreenStateEvent event,
    _Emit emit,
  ) async {
    emit(ChangeScreenState(event.screenState));
  }
}
