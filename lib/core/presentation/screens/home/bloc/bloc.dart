import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../models/book.dart';
import '../../../../domain/domain.dart';
import '../../../models/genre.dart';
import 'state.dart';
import 'event.dart';

typedef _Emit = Emitter<HomeState>;

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGenresUseCase getGenresUseCase;
  final GetPopularBooksUseCase getPopularBooksUseCase;

  List<Genre>? genres = [];
  List<Book>? books = [];

  HomeBloc(
    this.getPopularBooksUseCase,
    this.getGenresUseCase,
  ) : super(const InitState()) {
    on<FetchEvent>(_fetch);
  }

  Future<void> _fetch(FetchEvent event, _Emit emit) async {
    emit(const LoadingState());
    genres = await getGenresUseCase();
    books = await getPopularBooksUseCase();
    emit(FetchedState(
      genres: genres ?? [],
      books: books ?? [],
    ));
  }
}
