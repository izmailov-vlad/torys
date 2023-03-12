import 'package:flutter/material.dart';
import '../../../../utils/extentions/build_context_extension.dart';

class BaseInkWell extends StatelessWidget {
  final void Function()? onTap;
  final double radius;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Color? color;

  const BaseInkWell({
    Key? key,
    required this.onTap,
    this.radius = 50,
    required this.child,
    this.borderRadius,
    this.padding,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: InkWell(
        onTap: () => Future.delayed(const Duration(milliseconds: 100), onTap),
        radius: radius,
        highlightColor: Colors.transparent,
        splashColor: context.theme.splashColor,
        borderRadius: borderRadius,
        child: Ink(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
