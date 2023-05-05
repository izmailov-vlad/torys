import 'package:sizer/sizer.dart';
import '../../../presentation.dart';
import '../../../widgets/genre.dart';

class Categories extends StatelessWidget {
  final List<CategoryUIModel> categories;
  final Function({required int categoryId}) onCategoryTap;

  const Categories({
    Key? key,
    required this.categories,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        children: categories
            .take(7)
            .map(
              (e) => BookGenre(
                name: e.title,
                onTap: () => onCategoryTap(categoryId: e.id),
              ),
            )
            .toList(),
      ),
    );
  }
}
