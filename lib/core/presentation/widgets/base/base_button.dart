import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function() onPressed;
  final EdgeInsets? padding;
  final Widget child;

  const BaseButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
