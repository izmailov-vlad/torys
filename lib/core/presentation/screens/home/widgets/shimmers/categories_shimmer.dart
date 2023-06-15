import '../../../../presentation.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppMargin.mediumMargin.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer(
                duration: Duration(seconds: 3),
                //Default value
                color: AppColorsScheme.white,
                //Default value
                enabled: true,
                //Default value
                direction: ShimmerDirection.fromLTRB(),
                //Default Value
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    height: 4.h,
                    width: 17.w,
                    child: ColoredBox(
                      color: AppColorsScheme.secondary4,
                    ),
                  ),
                ),
              ),
              Shimmer(
                duration: Duration(seconds: 3),
                //Default value
                color: AppColorsScheme.white,
                //Default value
                enabled: true,
                //Default value
                direction: ShimmerDirection.fromLTRB(),
                //Default Value
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    height: 4.h,
                    width: 26.w,
                    child: ColoredBox(
                      color: AppColorsScheme.secondary4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 4,
            children: List.generate(
              7,
              (index) => Padding(
                padding: EdgeInsets.only(
                  top: AppMargin.smallMargin.h,
                ),
                child: Shimmer(
                  duration: Duration(seconds: 3),
                  //Default value
                  color: AppColorsScheme.white,
                  //Default value
                  enabled: true,
                  //Default value
                  direction: ShimmerDirection.fromLTRB(),
                  //Default Value
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      height: 4.h,
                      width: 18.w,
                      child: ColoredBox(
                        color: AppColorsScheme.secondary4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
