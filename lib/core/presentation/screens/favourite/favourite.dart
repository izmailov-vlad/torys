import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static const id = '/favourite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('favourite'),
      ),
    );
  }
}
