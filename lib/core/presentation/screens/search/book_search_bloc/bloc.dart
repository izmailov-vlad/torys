library book_search_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BookSearchState>;

@Injectable()
class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  final GetBooksByQueryUseCase _getBooksByQueryUseCase;

  BookSearchBloc(this._getBooksByQueryUseCase)
      : super(const BookSearchState.init()) {
    on<BookSearchFindByQuery>(_findByQuery);
    on<BookSearchEraseField>(_eraseSearchField);
  }

  Future<void> _eraseSearchField(BookSearchEraseField event, _Emit emit) async {

  }

  Future<void> _findByQuery(BookSearchFindByQuery event, _Emit emit) async {
    if (event.query.isEmpty) {
      emit(const BookSearchState.listState(show: false));
      return;
    }
    final books =
        await _getBooksByQueryUseCase(BooksByQueryParams(query: event.query));
    if (books == null) {
      emit(const BookSearchState.notFound());
      return;
    }
    emit(BookSearchState.booksFetched(books: books));
    emit(BookSearchState.listState(show: books.items.isNotEmpty));
  }
}
