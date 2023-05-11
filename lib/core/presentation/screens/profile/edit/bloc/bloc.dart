library profile_edit_bloc;

import '../../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<ProfileEditState>;

@Injectable()
class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SaveUserUseCase _saveUserUseCase;

  ProfileEditBloc(
    this._getCurrentUserUseCase,
    this._saveUserUseCase,
  ) : super(const ProfileEditState.init()) {
    on<ProfileEditInitEvent>(_init);
    on<ProfileEditSaveEvent>(_save);
  }

  Future<void> _init(ProfileEditInitEvent event, _Emit emit) async {
    final user = await _getCurrentUserUseCase(const NoParams());
    if (user == null) return;
    emit(ProfileEditState.fetch(user: user));
  }

  Future<void> _save(ProfileEditSaveEvent event, _Emit emit) async {
    await _saveUserUseCase(
      SaveUserParams(
        name: event.name,
        surname: event.surname,
        email: event.email,
      ),
    );
    emit(const ProfileEditState.navigateBackState());
  }
}
