import '../../../../../../ui.dart';

class BookDetailInfo extends StatelessWidget {
  final String title;
  final String value;

  const BookDetailInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorsScheme.grey4,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppRadius.mainRadius,
          ),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.withColor(AppColorsScheme.grey1),
          ),
        ],
      ),
    );
  }
}
