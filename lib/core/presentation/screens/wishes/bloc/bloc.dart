library wishes_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<WishesState>;

@Injectable()
class WishesBloc extends Bloc<WishesEvent, WishesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final SetUserWishesPassed _setUserWishesPassed;

  WishesBloc(
    this._getCategoriesUseCase,
    this._setUserWishesPassed,
  ) : super(const WishesState.init()) {
    on<WishesLoadEvent>(_load);
    on<WishesOnCategoryTapEvent>(_onCategoryTap);
    on<WishesSaveEvent>(_save);
  }

  Future<void> _load(WishesLoadEvent event, _Emit emit) async {
    final categories = await _getCategoriesUseCase(const NoParams());
    if (categories == null) return;
    final categoriesMap = {for (var e in categories) e.id: false};

    emit(
      WishesState.fetched(
        categories: categories,
        selectedCategories: categoriesMap,
      ),
    );
  }

  Future<void> _save(WishesSaveEvent event, _Emit emit) async {
    final selectedCategories = event.selectedCategories.keys
        .where((key) => event.selectedCategories[key] == true)
        .toList();
    final result = await _setUserWishesPassed(SetUserWishesPassedParams(
      categoryIds: selectedCategories,
    ));
    if (result == false) return;
    emit(const WishesState.saved());
  }

  Future<void> _onCategoryTap(
    WishesOnCategoryTapEvent event,
    _Emit emit,
  ) async {
    final selCat = Map<int, bool>.from(event.selectedCategories)
      ..update(event.id, (value) => !value);

    emit(WishesState.fetched(
      selectedCategories: selCat,
      categories: event.categories,
    ));
  }
}
