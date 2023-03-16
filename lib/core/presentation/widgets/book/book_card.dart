import 'package:sizer/sizer.dart';

import '../../../../ui.dart';
import '../../screens/home/widgets/author_name.dart';
import '../../screens/home/widgets/book_title.dart';
import '../../screens/home/widgets/rate.dart';

class BookCard extends StatelessWidget {
  final int id;
  final String image;
  final String bookTitle;
  final String authorName;
  final double rate;
  final Function({required int bookId}) onTap;

  const BookCard({
    Key? key,
    required this.id,
    required this.image,
    required this.bookTitle,
    required this.authorName,
    required this.onTap,
    required this.rate,
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
            Stack(
              children: [
                Image.asset(
                  AppImages.book,
                  fit: BoxFit.contain,
                ),
                Rate(rate: rate),
              ],
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
