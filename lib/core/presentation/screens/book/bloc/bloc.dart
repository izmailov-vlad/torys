library book_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BookDetailState>;

@Injectable()
class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final BookChangeFavoriteUseCase _bookChangeFavoriteUseCase;
  final GetBookByIdUseCase _getBookByIdUseCase;
  final BookAddCommentUseCase _bookAddCommentUseCase;
  final GetBookCommentsUseCase _getBookCommentsUseCase;
  final ChangeBookCommentStatusLikeUseCase _changeBookCommentLikeStatusUseCase;
  final ChangeBookRateUseCase _changeBookRateUseCase;

  BookDetailBloc(
    this._bookChangeFavoriteUseCase,
    this._getBookByIdUseCase,
    this._bookAddCommentUseCase,
    this._getBookCommentsUseCase,
    this._changeBookCommentLikeStatusUseCase,
    this._changeBookRateUseCase,
  ) : super(const BookDetailInitState()) {
    on<BookChangeFavoriteEvent>(_changeFavorite);
    on<BookInitEvent>(_init);
    on<BookDetailAddCommentEvent>(_addComment);
    on<BookDetailChangeCommentLikeStatusEvent>(_changeCommentLikeStatus);
    on<BookDetailChangeRateEvent>(_changeRate);
  }

  Future<void> _init(BookInitEvent event, _Emit emit) async {
    final book = await _getBookByIdUseCase(BookByIdParams(
      id: event.id,
    ));
    if (book == null) return;
    emit(BookDetailState.fetch(book: book));
    emit(BookDetailState.changeComments(comment: book.comments));
  }

  Future<void> _changeRate(BookDetailChangeRateEvent event, _Emit emit) async {
    try {
      final newRate = await _changeBookRateUseCase(BookRateParams(
        bookId: event.book.id,
        rate: event.rate,
      ));
      if (newRate == null) return;
      emit(BookDetailState.fetch(book: event.book.copyWith(rate: newRate)));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(ErrorState(error));
        },
      );
    }
  }

  Future<void> _changeFavorite(
    BookChangeFavoriteEvent event,
    _Emit emit,
  ) async {
    final isFavorite =
        await _bookChangeFavoriteUseCase(BookChangeFavoriteParams(event.id));
    if (isFavorite == null) return;
    emit(BookDetailState.fetch(
      book: event.book.copyWith(isFavorite: isFavorite),
    ));
  }

  Future<void> _addComment(BookDetailAddCommentEvent event, _Emit emit) async {
    final isAdded = await _bookAddCommentUseCase(
      AddBookCommentParams(
        bookId: event.bookId,
        text: event.comment,
      ),
    );
    if (isAdded == null || !isAdded) return;

    final comments = await _getBookCommentsUseCase(GetBookCommentsParams(
      bookId: event.bookId,
    ));
    emit(
      BookDetailState.changeComments(
        comment: comments?.reversed.toList() ?? [],
      ),
    );
  }

  Future<void> _changeCommentLikeStatus(
    BookDetailChangeCommentLikeStatusEvent event,
    _Emit emit,
  ) async {
    try {
      final result = await _changeBookCommentLikeStatusUseCase(
        ChangeBookCommentStatusLikeParams(
          commentId: event.commentId,
        ),
      );
      if (result == null) return;
      final comments = await _getBookCommentsUseCase(GetBookCommentsParams(
        bookId: event.bookId,
      ));
      emit(
        BookDetailState.changeComments(
          comment: comments ?? [],
        ),
      );
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(ErrorState(error));
        },
      );
    }
  }
}
