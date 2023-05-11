import '../../../presentation.dart';
import 'books_cards.dart';
import 'category_title.dart';

class BookCategory extends StatelessWidget {
  final int id;
  final String title;
  final List<BookUiModel> books;
  final Function({required String bookId}) onBookTap;
  final Function({required int categoryId}) onShowAllTap;
  final bool withBorder;

  const BookCategory({
    Key? key,
    required this.id,
    required this.title,
    required this.books,
    required this.onBookTap,
    required this.onShowAllTap,
    this.withBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppMargin.mediumMargin.h),
          Row(
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

              if (!withBorder)
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
                    onTap: () => onShowAllTap(categoryId: id),
                  ),
                ),
            ],
          ),
          SizedBox(height: AppMargin.mediumMargin.h),
          BookCards(
            books: books,
            onTap: onBookTap,
            withBorder: withBorder,
          ),
        ],
      ),
    );
  }
}
