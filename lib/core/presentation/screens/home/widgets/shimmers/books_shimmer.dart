import '../../../../presentation.dart';

class BooksShimmer extends StatelessWidget {
  const BooksShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppMargin.mediumMargin.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppMargin.largeMargin.w),
            child: Row(
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
          ),
          SizedBox(
            height: 26.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: AppPadding.smallPadding.h,
                    left: AppPadding.mediumPadding.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
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
                              height: 26.h,
                              width: 30.w,
                              child: ColoredBox(
                                color: AppColorsScheme.secondary4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppMargin.superSmallMargin.h,
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
                            height: 2.h,
                            width: 30.w,
                            child: ColoredBox(
                              color: AppColorsScheme.secondary4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppMargin.superSmallMargin.h,
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
                            height: 2.h,
                            width: 28.w,
                            child: ColoredBox(
                              color: AppColorsScheme.secondary4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
