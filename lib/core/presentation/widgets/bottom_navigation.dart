import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torys/core/presentation/screens/main/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/main/bloc/event.dart';
import 'package:torys/core/presentation/screens/main/bloc/state.dart';
import 'package:torys/resources/svgs.dart';
import 'package:torys/resources/theme.dart';

class TorysBottomNavigation extends StatelessWidget {
  const TorysBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onIconTap({required Screen destination}) {
      context.read<MainBloc>().add(MainEvent.changeScreen(destination));
    }

    Widget iconTab(
        {required String icon,
        required String text,
        required bool isActive,
        required Function onTap}) {
      return InkWell(
        enableFeedback: false,
        onTap: () => onTap(),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: isActive ? TorysTheme.mainColor : TorysTheme.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive ? TorysTheme.mainColor : TorysTheme.grey,
              ),
            )
          ],
        ),
      );
    }

    return BlocBuilder<MainBloc, MainState>(
      builder: ((context, state) {
        return Container(
          color: TorysTheme.darkGrey,
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconTab(
                    icon: icHome,
                    text: 'Главная',
                    isActive: state.currentScreen == Screen.home,
                    onTap: () => _onIconTap(
                      destination: Screen.home,
                    ),
                  ),
                  iconTab(
                    icon: icSearch,
                    text: 'Поиск',
                    isActive: state.currentScreen == Screen.search,
                    onTap: () => _onIconTap(
                      destination: Screen.search,
                    ),
                  ),
                  iconTab(
                    icon: icFavourite,
                    text: 'Избранное',
                    isActive: state.currentScreen == Screen.favourite,
                    onTap: () => _onIconTap(
                      destination: Screen.favourite,
                    ),
                  ),
                  iconTab(
                    icon: icProfile,
                    text: 'Профиль',
                    isActive: state.currentScreen == Screen.profile,
                    onTap: () => _onIconTap(
                      destination: Screen.profile,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
