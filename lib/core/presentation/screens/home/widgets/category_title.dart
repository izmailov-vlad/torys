import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final EdgeInsets? customPadding;

  const CategoryTitle({Key? key, required this.title, this.customPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppPadding.largePadding.w,
        top: 3.0.h,
        bottom: 3.0.h,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.toBold(),
      ),
    );
  }
}
