import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'event.dart';
import 'state.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitState()) {
    on<Load>(_load);
    on<ChangeScreen>(_changeScreen);
  }

  _changeScreen(
    ChangeScreen event,
    Emitter emit,
  ) async {
    emit(MainChangeScreenState(
      event.screenIndex,
    ));
  }

  _load(Load event, Emitter emit) async* {}
}
