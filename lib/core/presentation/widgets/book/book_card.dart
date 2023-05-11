import 'package:sizer/sizer.dart';
import '../../../../ui.dart';
import '../../screens/home/widgets/author_name.dart';
import '../../screens/home/widgets/book_title.dart';
import '../../screens/home/widgets/rate.dart';
import '../base/base_image.dart';

class BookCard extends StatelessWidget {
  final String id;
  final String? image;
  final String bookTitle;
  final String authorName;
  final Function({required String bookId}) onTap;

  const BookCard({
    Key? key,
    required this.id,
    this.image,
    required this.bookTitle,
    required this.authorName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(bookId: id),
      child: SizedBox(
        width: 30.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BaseImage(
                imageType: image != null ? ImageType.network : ImageType.asset,
                imagePath: image ?? AppImages.bookPlaceholder,
                radius: 10,
              ),
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
    );
  }
}
