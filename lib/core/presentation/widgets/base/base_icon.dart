import '../../presentation.dart';

class BaseIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Icon icon;
  final Color? color;

  const BaseIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: icon,
      ),
    );
  }
}
