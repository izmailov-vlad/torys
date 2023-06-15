library book_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BooksState>;

@Injectable()
class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksByCategoryIdUseCase _getBooksByCategoryIdUseCase;
  final BookChangeFavoriteUseCase _bookChangeFavoriteUseCase;

  BooksBloc(this._getBooksByCategoryIdUseCase, this._bookChangeFavoriteUseCase)
      : super(const BooksInitState()) {
    on<BooksOnTapEvent>(_onBookTap);
    on<BooksOnFavoriteTapEvent>(_onFavoriteTap);
    on<BooksFetchEvent>(_fetch, transformer: droppable());
    on<BooksUpdateBookEvent>(_updateBook);
  }

  Future<void> _fetch(BooksFetchEvent event, _Emit emit) async {
    try {
      final startIndex = event.books?.items.length ?? 0;
      final books = event.books;

      final newBooks = await _getBooksByCategoryIdUseCase(
        BooksByCategoryIdParams(
          id: event.id,
          pagination: PaginationModel(
            startIndex: startIndex,
            maxResult: 10,
          ),
        ),
      );
      if (newBooks == null) return;
      if (books == null) {
        emit(BooksFetchedState(books: BooksUiModel(items: newBooks.items)));
        return;
      }
      books.items.addAll(newBooks.items);

      emit(BooksFetchedState(books: BooksUiModel(items: books.items)));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(BooksState.error(error: error));
        },
      );
    }
  }

  Future<void> _updateBook(BooksUpdateBookEvent event, _Emit emit) async {
    var newItems = event.books.items;
    final index = newItems.indexWhere((element) => element.id == event.book.id);

    newItems[index] = event.book;

    emit(BooksState.fetched(
      books: BooksUiModel(items: newItems),
    ));
  }

  Future<void> _onBookTap(BooksOnTapEvent event, _Emit emit) async {}

  Future<void> _onFavoriteTap(
    BooksOnFavoriteTapEvent event,
    _Emit emit,
  ) async {
    final isFavorite =
        await _bookChangeFavoriteUseCase(BookChangeFavoriteParams(event.id));
    if (isFavorite == null) return;

    var newItems = event.books.items;
    final index = newItems.indexWhere((element) => element.id == event.id);

    newItems[index] = newItems[index].copyWith(isFavorite: isFavorite);

    emit(BooksState.fetched(
      books: BooksUiModel(items: newItems),
    ));
  }
}
