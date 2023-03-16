import '../../../ui.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}
