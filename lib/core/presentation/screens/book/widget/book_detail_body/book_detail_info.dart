import '../../../../presentation.dart';

class BookDetailInfo extends StatelessWidget {
  final String value;
  final String title;
  final String iconPath;

  const BookDetailInfo({
    Key? key,
    required this.value,
    required this.title,
    required this.iconPath,
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
          Column(
            children: [
              Row(
                children: [
                  BaseImage(
                    imageType: ImageType.asset,
                    imagePath: iconPath,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(width: AppMargin.mediumMargin.w),
                  BaseText(
                    title: value,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            title,
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
