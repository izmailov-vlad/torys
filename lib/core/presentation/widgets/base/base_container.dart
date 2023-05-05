import '../../../../ui.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  const BaseContainer({
    Key? key,
    required this.child, this.padding, this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: decoration ?? const BoxDecoration(
        color: AppColorsScheme.white,
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.mainRadius),
        ),
      ),
      child: child,
    );
  }
}
