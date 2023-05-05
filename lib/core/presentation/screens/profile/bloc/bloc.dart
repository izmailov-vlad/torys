import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<ProfileState>;

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;

  ProfileBloc(
    this._getCurrentUserUseCase,
    this._logoutUseCase,
  ) : super(const ProfileInitState()) {
    on<ProfileLoad>(_load);
    on<ProfileLogout>(_logout);
  }

  Future<void> _load(ProfileLoad event, _Emit emit) async {
    final user = await _getCurrentUserUseCase(const NoParams());
    if (user == null) return;
    emit(FetchedState(user: user));
  }

  Future<void> _logout(ProfileLogout event, _Emit emit) async {
    final user = await _logoutUseCase(const NoParams());
    if (user == null) return;
    emit(const ProfileState.logout());
  }
}
