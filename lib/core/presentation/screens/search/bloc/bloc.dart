import '../../../../../utils/app_logger.dart';
import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<SearchState>;

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetBooksByCategoryIdUseCase _getBooksByCategoryIdUseCase;

  SearchBloc(this._getCategoriesUseCase, this._getBooksByCategoryIdUseCase)
      : super(const SearchInitState()) {
    on<SearchLoad>(_load);
    on<OnCategoryTap>(_onCategoryTap);
  }

  Future<void> _load(SearchLoad event, _Emit emit) async {
    final categories = await _getCategoriesUseCase(const NoParams());
    emit(SearchFetchedState(categories: categories ?? []));
  }

  Future<void> _onCategoryTap(OnCategoryTap event, _Emit emit) async {
    try {
      final books = await _getBooksByCategoryIdUseCase(
        BooksByCategoryIdParams(event.id),
      );
      if (books == null) return;
      emit(SearchNavigateToBooksByCategoryState(books: books));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {
          emit(SearchErrorState(error: error));
        },
      );
    }
  }
}
