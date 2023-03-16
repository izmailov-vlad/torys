import 'package:sizer/sizer.dart';

import '../../../../ui.dart';
import '../../screens/home/widgets/author_name.dart';
import '../../screens/home/widgets/book_title.dart';

class BookCardWithBorder extends StatelessWidget {
  final int id;
  final String image;
  final String bookTitle;
  final String authorName;
  final Function({required int bookId}) onTap;

  const BookCardWithBorder({
    Key? key,
    required this.id,
    required this.image,
    required this.bookTitle,
    required this.authorName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      semanticContainer: false,
      borderOnForeground: false,
      child: SizedBox(
        width: 27.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
              child: Image.asset(
                AppImages.book,

                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppPadding.smallPadding.h,
                left: AppPadding.smallPadding.w,
              ),
              child: BookTitle(title: bookTitle),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppPadding.smallPadding.w),
              child: AuthorName(name: authorName),
            ),
          ],
        ),
      ),
    );
  }
}
