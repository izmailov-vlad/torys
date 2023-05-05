import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';
import '../../../presentation.dart';
import '../../../widgets/base/base_title.dart';
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTitle(title: title),
              if (!withBorder)
                Padding(
                  padding: EdgeInsets.only(
                    right: AppPadding.largePadding.w,
                  ),
                  child: BaseText(
                    title: 'Показать все',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.toBold()
                        .withColor(AppColorsScheme.mainColor),
                    onTap: () => onShowAllTap(categoryId: id),
                  ),
                ),
            ],
          ),
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
