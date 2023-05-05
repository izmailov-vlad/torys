import 'package:sizer/sizer.dart';
import '../../../../../../ui.dart';
import '../../../../widgets/base/base_title.dart';

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPadding.mediumPadding.h,
        left: AppPadding.mediumPadding.w,
        right: AppPadding.mediumPadding.w,
      ),
      child: Column(
        children: [
          _StatisticsItem(title: 'Прочитано', value: '5 книг'),
          _StatisticsItem(title: 'Неделя', value: '1 книга / 4 часа'),
          _StatisticsItem(title: 'Месяц', value: '5 книг / 20 часов'),
          _StatisticsItem(title: 'Год', value: '30 книг / 120 часов'),
        ],
      ),
    );
  }
}

class _StatisticsItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatisticsItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.mediumPadding.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppPadding.mediumPadding.w,
              right: AppPadding.mediumPadding.w,
              bottom: AppPadding.mediumPadding.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  title: title,
                  style: Theme.of(context).textTheme.headlineLarge?.withColor(
                        AppColorsScheme.grey1,
                      ),
                ),
                BaseText(
                  title: value,
                  style: Theme.of(context).textTheme.headlineLarge?.toBold(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
            width: double.infinity,
            child: ColoredBox(color: AppColorsScheme.grey3),
          )
        ],
      ),
    );
  }
}
