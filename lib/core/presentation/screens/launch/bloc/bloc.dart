import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<LaunchState>;

@Injectable()
class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final CheckAuthUseCase _checkAuthUseCase;

  LaunchBloc(this._checkAuthUseCase) : super(const LaunchState.init()) {
    on<_CheckAuthEvent>(_checkAuth);
  }

  Future<void> _checkAuth(_CheckAuthEvent event, _Emit emit) async {
    try {
      final isAuth = await _checkAuthUseCase(const NoParams());
      if (isAuth) {
        emit(const LaunchState.navigateTo(NavigateToRoute.main));
        return;
      }
      emit(const LaunchState.navigateTo(NavigateToRoute.auth));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(const LaunchState.navigateTo(NavigateToRoute.auth));
        },
      );
    }
  }
}
