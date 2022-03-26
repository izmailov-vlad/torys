import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/search/bloc/event.dart';
import 'package:torys/core/presentation/screens/search/bloc/state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());
}
