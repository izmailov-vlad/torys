import '../../../presentation.dart';

class BookCategory extends StatelessWidget {
  final int? id;
  final String title;
  final Function({required int categoryId})? onShowAllTap;

  const BookCategory({
    Key? key,
    this.id,
    required this.title,
    this.onShowAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppPadding.largePadding.w,
          ),
          child: BaseText(
            title: title,
            style: Theme.of(context).textTheme.headlineLarge?.toBold(),
          ),
        ),
        if (onShowAllTap != null && id != null)
          Padding(
            padding: EdgeInsets.only(
              right: AppPadding.largePadding.w,
            ),
            child: BaseText(
              title: 'Показать все',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.toBold()
                  .withColor(AppColorsScheme.mainColor),
              onTap: () => onShowAllTap!(categoryId: id!),
            ),
          ),
      ],
    );
  }
}
