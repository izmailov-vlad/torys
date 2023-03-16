import 'package:sizer/sizer.dart';
import '../../../models/book.dart';
import '../../../../../ui.dart';
import '../../../widgets/book/book_card.dart';
import '../../../widgets/book/book_card_with_border.dart';

class BookCards extends StatelessWidget {
  final List<Book> books;
  final bool withBorder;
  final Function({required int bookId}) onTap;

  const BookCards(
      {Key? key,
      required this.books,
      required this.onTap,
      this.withBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 30.h,
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
                    image: books[index].image,
                    bookTitle: books[index].title,
                    authorName: books[index].author,
                    onTap: onTap,
                  )
                : BookCard(
                    id: books[index].id,
                    image: books[index].image,
                    bookTitle: books[index].title,
                    authorName: books[index].author,
                    rate: books[index].rate,
                    onTap: onTap,
                  ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
