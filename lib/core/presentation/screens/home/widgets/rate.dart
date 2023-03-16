import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';

class Rate extends StatelessWidget {
  final double rate;
  const Rate({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        margin: EdgeInsets.only(
          top: AppMargin.smallMargin.h,
          left: AppMargin.mediumMargin.w,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.mediumPadding.w,
          vertical: AppPadding.smallPadding.h,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.cardLabelRadius),
          ),
        ),
        child: Text(
          rate.toString(),
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.withColor(
            AppColorsScheme.white,
          )
              .adaptiveFontSize(),
        ),
      ),
    );
  }
}
