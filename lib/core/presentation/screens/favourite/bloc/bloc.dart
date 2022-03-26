import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/favourite/bloc/event.dart';
import 'package:torys/core/presentation/screens/favourite/bloc/state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState());
}
