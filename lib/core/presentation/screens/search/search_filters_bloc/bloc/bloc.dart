library search_filters_bloc;

import '../../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<BookSearchFiltersState>;

class SearchFiltersBloc
    extends Bloc<BookSearchFiltersEvent, BookSearchFiltersState> {
  SearchFiltersBloc() : super(const BookSearchFiltersState.init()) {
    on<BookSearchInitFiltersEvent>(_init);
  }

  Future<void> _init(BookSearchInitFiltersEvent event, _Emit emit) async {
    emit(const BookSearchFiltersState.fetch());
  }
}
