import 'package:sizer/sizer.dart';

import '../../../ui.dart';
import '../../../ui_kit/radius.dart';
import '../../../ui_kit/shadows.dart';

class BookGenre extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const BookGenre({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      decoration: BoxDecoration(
        color: AppColorsScheme.white,
        boxShadow: AppShadows.mainShadow,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.secondaryRadius),
        ),
      ),
      child: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.withColor(AppColorsScheme.mainColor),
      ),
    );
  }
}
