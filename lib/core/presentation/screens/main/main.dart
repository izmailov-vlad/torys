import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/favourite/favourite.dart';
import 'package:torys/core/presentation/screens/home/home.dart';
import 'package:torys/core/presentation/screens/main/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/main/bloc/state.dart';
import 'package:torys/core/presentation/screens/profile/profile.dart';
import 'package:torys/core/presentation/screens/search/search.dart';
import 'package:torys/core/presentation/widgets/appbar.dart';
import 'package:torys/core/presentation/widgets/bottom_navigation.dart';
import 'package:torys/resources/theme.dart';

class MainScreen extends StatelessWidget {
  static const id = '/main';
  final List<Widget> pages = const <Widget>[
    HomeScreen(
      key: PageStorageKey<String>(HomeScreen.id),
    ),
    SearchScreen(
      key: PageStorageKey<String>(SearchScreen.id),
    ),
    FavouriteScreen(
      key: PageStorageKey<String>(FavouriteScreen.id),
    ),
    ProfileScreen(
      key: PageStorageKey<String>(ProfileScreen.id),
    ),
  ];
  int currentScreen = 0;
  final PageStorageBucket _bucket = PageStorageBucket();
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: TorysAppBar(
          preferedSize: Size.fromHeight(91),
        ),
        bottomNavigationBar: TorysBottomNavigation(),
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return PageStorage(
              bucket: _bucket,
              child: pages[state.currentScreen.index],
            );
          },
        ),
      ),
    );
  }
}
