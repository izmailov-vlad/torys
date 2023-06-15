import '../../../../presentation.dart';

class BigBookCardShimmer extends StatelessWidget {
  const BigBookCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppMargin.largeMargin.w),
          child: Shimmer(
            duration: Duration(seconds: 3),
            //Default value
            color: Colors.white,
            //Default value
            enabled: true,
            //Default value
            direction: ShimmerDirection.fromLTRB(),
            //Default Value
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                height: 4.h,
                width: 20.w,
                child: ColoredBox(
                  color: AppColorsScheme.grey4,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: AppMargin.smallMargin.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(left: AppPadding.largePadding.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Shimmer(
                        duration: Duration(seconds: 3),
                        //Default value
                        color: Colors.white,
                        //Default value
                        enabled: true,
                        //Default value
                        direction: ShimmerDirection.fromLTRB(),
                        //Default Value
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            height: 35.h,
                            width: 45.w,
                            child: ColoredBox(
                              color: AppColorsScheme.grey4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppMargin.superSmallMargin.h),
                    Shimmer(
                      duration: Duration(seconds: 3),
                      //Default value
                      color: Colors.white,
                      //Default value
                      enabled: true,
                      //Default value
                      direction: ShimmerDirection.fromLTRB(),
                      //Default Value
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          height: 2.h,
                          width: 22.w,
                          child: ColoredBox(
                            color: AppColorsScheme.grey4,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppMargin.superSmallMargin.h),
                    Shimmer(
                      duration: Duration(seconds: 3),
                      //Default value
                      color: Colors.white,
                      //Default value
                      enabled: true,
                      //Default value
                      direction: ShimmerDirection.fromLTRB(),
                      //Default Value
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          height: 2.h,
                          width: 20.w,
                          child: ColoredBox(
                            color: AppColorsScheme.grey4,
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
    );
  }
}
