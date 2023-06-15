library take_photo_bloc;

import '../../../../presentation.dart';
import 'dart:convert' show utf8, base64;

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<TakePhotoState>;

@Injectable()
class TakePhotoBloc extends Bloc<TakePhotoEvent, TakePhotoState> {
  final UserUpdatePhotoUseCase _userUpdatePhotoUseCase;

  TakePhotoBloc(this._userUpdatePhotoUseCase)
      : super(TakePhotoState.fetched()) {
    on<TakePhotoInitEvent>(_onInit);
    on<TakePhotoSaveEvent>(_savePhoto);
  }

  Future<void> _onInit(TakePhotoInitEvent event, _Emit emit) async {}

  Future<void> _savePhoto(TakePhotoSaveEvent event, _Emit emit) async {
    await _userUpdatePhotoUseCase(UserPhotoModel(
      userPhotoPath: event.photoPath,
      userPhotoName: event.photoName,
    ));

    emit(TakePhotoState.navigateBack());
  }
}
