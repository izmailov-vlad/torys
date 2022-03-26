import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const id = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('search'),
      ),
    );
  }
}
