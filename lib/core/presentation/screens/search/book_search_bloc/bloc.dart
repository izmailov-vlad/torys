library book_search_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BookSearchState>;

@Injectable()
class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  final GetBooksByQueryUseCase _getBooksByQueryUseCase;
  final BookChangeFavoriteUseCase _bookChangeFavoriteUseCase;

  BookSearchBloc(
    this._getBooksByQueryUseCase,
    this._bookChangeFavoriteUseCase,
  ) : super(const BookSearchState.init()) {
    on<BookSearchFindByQuery>(_findByQuery, transformer: droppable());
    on<BookSearchEraseField>(_eraseSearchField);
    on<BookSearchFavoriteTapEvent>(_onFavoriteTap);
  }

  Future<void> _eraseSearchField(
    BookSearchEraseField event,
    _Emit emit,
  ) async {}

  Future<void> _onFavoriteTap(
    BookSearchFavoriteTapEvent event,
    _Emit emit,
  ) async {
    final isFavorite = await _bookChangeFavoriteUseCase(
      BookChangeFavoriteParams(event.bookId),
    );
    if (isFavorite == null) return;

    var newItems = event.books.items;
    final index = newItems.indexWhere((element) => element.id == event.bookId);

    newItems[index] = newItems[index].copyWith(isFavorite: isFavorite);

    emit(BookSearchState.booksFetched(
      books: BooksUiModel(items: newItems),
    ));
  }

  Future<void> _findByQuery(BookSearchFindByQuery event, _Emit emit) async {
    if (event.query.isEmpty) {
      emit(const BookSearchState.listState(show: false));
      return;
    }
    // emit(const BookSearchState.booksLoading());
    emit(const BookSearchState.listState(show: true));
    final startIndex = event.books?.items.length ?? 0;

    final newBooks = await _getBooksByQueryUseCase(BooksByQueryParams(
      query: event.query,
      pagination: PaginationModel(
        startIndex: startIndex,
        maxResult: 10,
      ),
    ));

    if (newBooks == null) {
      emit(const BookSearchState.notFound());
      return;
    }

    if (event.books == null) {
      emit(BookSearchState.booksFetched(
        books: BooksUiModel(items: newBooks.items),
      ));
      emit(BookSearchState.listState(show: newBooks.items.isNotEmpty));
      return;
    }
    event.books?.items.addAll(newBooks.items);

    emit(BookSearchState.booksFetched(books: event.books!));
    emit(BookSearchState.listState(show: event.books!.items.isNotEmpty));
  }
}
