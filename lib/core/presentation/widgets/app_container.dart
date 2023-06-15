import '../../../ui.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool withBorder;
  final bool withShadow;
  final Color? borderColor;
  final BoxDecoration? decoration;
  final Color? fillColor;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  const AppContainer({
    Key? key,
    required this.child,
    this.borderRadius,
    this.onTap,
    this.padding,
    this.withBorder = false,
    this.margin,
    this.decoration,
    this.borderColor,
    this.fillColor,
    this.width,
    this.height,
    this.withShadow = false,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: fillColor ?? Theme.of(context).colorScheme.surface,
            boxShadow: boxShadow ??
                (withShadow
                    ? [
                        const BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColorsScheme.grey3,
                          blurRadius: 8,
                          spreadRadius: 4,
                        )
                      ]
                    : null),
            border: withBorder
                ? Border.all(
                    width: 1,
                    color: borderColor ?? const Color(0xFF000000),
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
        ? GestureDetector(
            onTap: onTap,
            child: widget,
          )
        : widget;
  }
}

class AppAnimatedContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool withBorder;
  final bool withShadow;
  final Color? borderColor;
  final BoxDecoration? decoration;
  final Color? fillColor;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final Duration? duration;

  const AppAnimatedContainer({
    Key? key,
    required this.child,
    this.borderRadius,
    this.onTap,
    this.padding,
    this.withBorder = false,
    this.margin,
    this.decoration,
    this.borderColor,
    this.fillColor,
    this.width,
    this.height,
    this.withShadow = false,
    this.boxShadow, this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = AnimatedContainer(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: fillColor ?? Theme.of(context).colorScheme.surface,
            boxShadow: boxShadow ??
                (withShadow
                    ? [
                        const BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColorsScheme.grey3,
                          blurRadius: 8,
                          spreadRadius: 4,
                        )
                      ]
                    : null),
            border: withBorder
                ? Border.all(
                    width: 1,
                    color: borderColor ?? const Color(0xFF000000),
                  )
                : null,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(AppRadius.mainRadius),
                ),
          ),
      duration: duration ?? const Duration(milliseconds: 500),
      child: child,
    );
    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            child: widget,
          )
        : widget;
  }
}
