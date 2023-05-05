import '../../../presentation.dart';
import '../../../widgets/base/base_title.dart';
import 'package:sizer/sizer.dart';
import '../../../../../ui.dart';
import '../bloc/bloc.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryUIModel> categories;
  final Function({required int id}) onCategoryTap;

  const CategoriesListView({
    Key? key,
    required this.categories, required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: AppPadding.normalPadding.h),
        child: AppContainer(
          onTap: () => onCategoryTap(id: categories[index].id),
          child: Padding(
            padding: EdgeInsets.only(
              left: AppPadding.largePadding.w,
              top: AppPadding.bigPadding.h,
              bottom: AppPadding.bigPadding.h,
            ),
            child: BaseText(
              title: categories[index].title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}
