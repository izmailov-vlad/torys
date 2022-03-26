import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:torys/core/presentation/screens/main/bloc/event.dart';
import 'package:torys/core/presentation/screens/main/bloc/state.dart';

typedef Main = Stream<MainState>;

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) => event.when(
        load: _load,
        changeScreen: _changeScreen,
      );
  Main _changeScreen(Screen destination) async* {
    yield state.copyWith(
      currentScreen: destination,
    );
  }

  Main _load() async* {}
}
