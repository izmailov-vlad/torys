import 'package:flutter/material.dart';

class SpotifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferedSize;
  final Widget body;
  const SpotifyAppBar({
    Key? key,
    required this.body,
    required this.preferedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.5),
      height: preferedSize.height,
      child: body,
    );
  }

  @override
  Size get preferredSize => preferedSize;
}
