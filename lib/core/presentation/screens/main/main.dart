import 'package:flutter/material.dart';
import 'package:torys/core/presentation/widgets/appbar.dart';
import 'package:torys/core/presentation/widgets/bottom_navigation.dart';
import 'package:torys/resources/theme.dart';

class MainScreen extends StatelessWidget {
  static const id = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TorysAppBar(
        preferedSize: Size.fromHeight(91),
      ),
      bottomNavigationBar: TorysBottomNavigation(),
      body: Center(
        child: CircularProgressIndicator(
          color: TorysTheme.mainColor,
        ),
      ),
    );
  }
}
