import '../../../../../utils/app_logger.dart';
import '../../../presentation.dart';

part 'state.dart';

part 'event.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<HomeState>;

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetPopularBooksUseCase _getPopularBooksUseCase;
  final GetBooksByCategories _getBooksByCategories;
  final GetBookByIdUseCase _getBookByIdUseCase;
  final GetBooksByCategoryIdUseCase _getBooksByCategoryId;
  final GetNewBooksUseCase _getNewBooksUseCase;

  HomeBloc(
    this._getPopularBooksUseCase,
    this.getCategoriesUseCase,
    this._getBooksByCategories,
    this._getBookByIdUseCase,
    this._getBooksByCategoryId,
    this._getNewBooksUseCase,
  ) : super(const InitState()) {
    on<FetchEvent>(_fetch);
    on<ChooseBookEvent>(_onChooseBook);
    on<ShowAllEvent>(_showAll);
  }

  Future<void> _fetch(FetchEvent event, _Emit emit) async {
    try {
      emit(const LoadingState());
      final categories = await getCategoriesUseCase(const NoParams());
      if (categories != null) {
        emit(HomeState.fetchedCategories(categories: categories));
      }

      final newBooks = await _getNewBooksUseCase(const NoParams());
      if (newBooks != null) {
        emit(HomeState.fetchedNewBooks(newBooks: newBooks.items));
      }

      final popularBooks = await _getPopularBooksUseCase(const NoParams());
      if (popularBooks != null) {
        emit(HomeState.fetchedPopularBooks(popularBooks: popularBooks));
      }

      final booksByCategories = await _getBooksByCategories(const NoParams());
      if (booksByCategories != null) {
        emit(HomeState.fetchedBooksByCategories(
          booksByCategories: booksByCategories,
        ));
      }
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

  Future<void> _showAll(ShowAllEvent event, _Emit emit) async {
    emit(HomeState.navigateToBooks(categoryId: event.categoryId));
  }

  Future<void> _onChooseBook(ChooseBookEvent event, _Emit emit) async {
    try {
      final book = await _getBookByIdUseCase(BookByIdParams(id: event.bookId));
      if (book == null) return;
      emit(NavigateToBookDetailState(book: book));
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
