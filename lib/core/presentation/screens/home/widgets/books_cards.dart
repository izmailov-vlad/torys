import 'package:sizer/sizer.dart';
import '../../../../../ui.dart';
import '../../../presentation.dart';
import '../../../widgets/book/book_card.dart';
import '../../../widgets/book/book_card_with_border.dart';
import 'category.dart';

class BookCards extends StatelessWidget {
  final List<BookUiModel> books;
  final BookCategory? category;
  final bool withBorder;
  final bool bigCard;
  final Function({required String bookId}) onTap;

  const BookCards({
    Key? key,
    required this.books,
    required this.onTap,
    this.withBorder = false,
    this.category,
    this.bigCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (category != null) category!,
        SizedBox(height: AppMargin.mediumMargin.h),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: withBorder ? 20.h : bigCard ? 36.h : 26.h,
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
                    : bigCard
                        ? BookCard(
                            id: books[index].id,
                            image: books[index].volumeInfo.imageLinks?.image,
                            bookTitle: books[index].title,
                            authorName: books[index].authors.isNotEmpty
                                ? books[index].authors.first
                                : '',
                            onTap: onTap,
                            big: bigCard,
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
    );
  }
}
