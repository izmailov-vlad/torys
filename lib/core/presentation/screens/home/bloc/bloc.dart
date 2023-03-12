import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/domain.dart';
import '../../../entities/genre.dart';
import 'state.dart';
import 'event.dart';

typedef _Emit = Emitter<HomeState>;

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGenresUseCase getGenresUseCase;

  List<Genre>? genres = [];

  HomeBloc(
    this.getGenresUseCase,
  ) : super(const InitState()) {
    on<FetchEvent>(_fetch);
  }

  Future<void> _fetch(FetchEvent event, _Emit emit) async {
    emit(const LoadingState());
    genres = await getGenresUseCase();
    emit(FetchedState(genres: genres ?? []));
  }
}
