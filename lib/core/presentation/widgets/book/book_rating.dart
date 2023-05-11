import '../../presentation.dart';

class BookRating extends StatelessWidget {
  final int value;
  final double? size;
  final void Function(int) onValueChanged;

  const BookRating({
    Key? key,
    this.value = 0,
    required this.onValueChanged,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          final filled = index < value;
          return GestureDetector(
            onTap: () => onValueChanged(index + 1),
            child: AnimatedContainer(
              height: size,
              width: size,
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: filled
                    ? context.theme.colorScheme.primary
                    : AppColorsScheme.grey3,
              ),
              child: Icon(
                filled ? Icons.star : Icons.star_border,
                color: context.theme.colorScheme.surface,
                size: size != null ? size! * 0.5 : size,
              ),
            ),
          );
        },
      ),
    );
  }
}
