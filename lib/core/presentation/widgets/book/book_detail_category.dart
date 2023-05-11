import '../../presentation.dart';

class BookDetailCategory extends StatelessWidget {
  final String name;

  const BookDetailCategory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      borderColor: AppColorsScheme.grey2,
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.largePadding.w,
        vertical: AppPadding.smallPadding.h,
      ),
      withBorder: true,
      child: BaseText(
        title: name,
        style: context.theme.textTheme.headlineLarge?.toBold(),
      ),
    );
  }
}
