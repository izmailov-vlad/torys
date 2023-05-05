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
      // final books = await _getPopularBooksUseCase();
      final newBooks = await _getNewBooksUseCase(const NoParams());

      final booksByCategories = await _getBooksByCategories(const NoParams());

      emit(FetchedState(
        categories: categories ?? [],
        books: [],
        booksByCategories: booksByCategories ??
            CategoriesBooksUIModel(
              categoriesBooks: [],
            ),
        newBooks: newBooks?.items ?? [],
      ));
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
    final books = await _getBooksByCategoryId(
      BooksByCategoryIdParams(event.categoryId),
    );
    if (books == null) return;
    emit(HomeState.navigateToBooks(books: books));
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
