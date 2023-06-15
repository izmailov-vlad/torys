import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<SearchState>;

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  SearchBloc(
    this._getCategoriesUseCase,
  ) : super(const SearchInitState()) {
    on<SearchLoad>(_fetch);
    on<OnCategoryTap>(_onCategoryTap);
  }

  Future<void> _fetch(SearchLoad event, _Emit emit) async {
    final categories = await _getCategoriesUseCase(const NoParams());
    emit(SearchFetchedState(categories: categories ?? []));
  }

  Future<void> _onCategoryTap(OnCategoryTap event, _Emit emit) async {
    emit(SearchNavigateToBooksByCategoryState(categoryId: event.id));
  }
}
