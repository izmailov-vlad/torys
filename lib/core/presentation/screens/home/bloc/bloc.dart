import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/home/bloc/event.dart';
import 'package:torys/core/presentation/screens/home/bloc/state.dart';

typedef Home = Stream<HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) => event.when(load: _load);

  Home _load() async* {}
}
