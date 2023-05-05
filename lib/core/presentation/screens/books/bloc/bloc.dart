library book_bloc;

import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BooksState>;

@Injectable()
class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(const BooksInitState()) {
    on<BooksOnTapEvent>(_onBookTap);
    on<BooksOnFavoriteTapEvent>(_onFavoriteTap);
  }

  Future<void> _onBookTap(BooksOnTapEvent event, _Emit emit) async {}

  Future<void> _onFavoriteTap(BooksOnFavoriteTapEvent event, _Emit emit) async {}
}
