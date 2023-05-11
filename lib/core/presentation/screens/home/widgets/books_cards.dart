import 'package:sizer/sizer.dart';
import '../../../../../ui.dart';
import '../../../presentation.dart';
import '../../../widgets/book/book_card.dart';
import '../../../widgets/book/book_card_with_border.dart';

class BookCards extends StatelessWidget {
  final List<BookUiModel> books;

  final bool withBorder;
  final Function({required String bookId}) onTap;

  const BookCards({
    Key? key,
    required this.books,
    required this.onTap,
    this.withBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.symmetric(vertical: AppPadding.mediumPadding.h),
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 3),
            color: AppColorsScheme.grey3,
            blurRadius: 8,
            spreadRadius: 2),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: withBorder ? 20.h : 32.h,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                EdgeInsets padding = EdgeInsets.zero;
                if (index == 0) {
                  padding = EdgeInsets.only(
                    left: AppPadding.largePadding.w,
                    right: AppPadding.mediumPadding.w,
                  );
                } else if (index != books.length - 1) {
                  padding = EdgeInsets.only(
                    right: AppPadding.mediumPadding.w,
                  );
                } else {
                  padding = EdgeInsets.only(
                    right: AppPadding.largePadding.w,
                  );
                }
                return Padding(
                  padding: padding,
                  child: withBorder
                      ? BookCardWithBorder(
                          id: books[index].id,
                          image: books[index].volumeInfo.imageLinks?.image,
                          bookTitle: books[index].title,
                          authorName: books[index].authors.isNotEmpty
                              ? books[index].authors.first
                              : '',
                          onTap: onTap,
                        )
                      : BookCard(
                          id: books[index].id,
                          image: books[index].volumeInfo.imageLinks?.image,
                          bookTitle: books[index].title,
                          authorName: books[index].authors.isNotEmpty
                              ? books[index].authors.first
                              : '',
                          onTap: onTap,
                        ),
                );
              },
              itemCount: books.length,
            ),
          ),
        ],
      ),
    );
  }
}
