import '../../../ui.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool withBorder;
  final BoxDecoration? decoration;

  const AppContainer({
    Key? key,
    required this.child,
    this.borderRadius,
    this.onTap,
    this.padding,
    this.withBorder = false,
    this.margin,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      padding: padding,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: withBorder
                ? Border.all(
                    width: 1,
                  )
                : null,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(AppRadius.mainRadius),
                ),
          ),
      child: child,
    );
    return onTap != null
        ? Material(
            child: InkWell(
              onTap: onTap,
              child: widget,
            ),
          )
        : widget;
  }
}
