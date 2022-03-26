import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/profile/bloc/event.dart';
import 'package:torys/core/presentation/screens/profile/bloc/state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState());
}
