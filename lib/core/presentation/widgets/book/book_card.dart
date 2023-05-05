import 'package:sizer/sizer.dart';
import '../../../../ui.dart';
import '../../screens/home/widgets/author_name.dart';
import '../../screens/home/widgets/book_title.dart';
import '../../screens/home/widgets/rate.dart';

class BookCard extends StatelessWidget {
  final String id;
  final String image;
  final String bookTitle;
  final String authorName;
  final Function({required String bookId}) onTap;

  const BookCard({
    Key? key,
    required this.id,
    required this.image,
    required this.bookTitle,
    required this.authorName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(bookId: id),
      child: Card(
        margin: EdgeInsets.zero,
        semanticContainer: false,
        borderOnForeground: false,
        child: SizedBox(
          width: 45.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                fit: BoxFit.contain,
                width: 45.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppPadding.normalPadding.h,
                  left: AppPadding.smallPadding.w,
                ),
                child: BookTitle(title: bookTitle),
              ),
              SizedBox(height: AppMargin.smallMargin.h),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.smallPadding.w),
                child: AuthorName(name: authorName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
