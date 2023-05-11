library favorite_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<FavoriteState>;

@Injectable()
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetUserFavoriteBookUseCase _getUserFavoriteBookUseCase;
  final BookChangeFavoriteUseCase _bookChangeFavoriteUseCase;

  FavoriteBloc(
    this._getUserFavoriteBookUseCase,
    this._bookChangeFavoriteUseCase,
  ) : super(const FavoriteState.init()) {
    on<FavoriteInitEvent>(_init);
    on<FavoriteOnTapEvent>(_onFavoriteTap);
    on<FavoriteOnBookTapEvent>(_onBookTap);
  }

  Future<void> _init(FavoriteInitEvent event, _Emit emit) async {
    final books = await _getUserFavoriteBookUseCase(const NoParams());
    if (books == null) return;
    emit(FavoriteState.fetched(books: books));
  }

  Future<void> _onBookTap(FavoriteOnBookTapEvent event, _Emit emit) async {
    emit(FavoriteState.navigateToBook(bookId: event.id));
  }

  Future<void> _onFavoriteTap(FavoriteOnTapEvent event, _Emit emit) async {
    final result =
        await _bookChangeFavoriteUseCase(BookChangeFavoriteParams(event.id));
    if (result == null) return;
    emit(FavoriteState.changeFavorite(isFavorite: result));
  }
}