import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('home'),
      ),
    );
  }
}
