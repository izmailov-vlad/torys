import '../../../presentation.dart';

class SearchBooksShimmer extends StatelessWidget {
  const SearchBooksShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      fillColor: AppColorsScheme.white,
      height: context.screenSize.height,
      borderRadius: BorderRadius.zero,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppMargin.mediumMargin.h),
            child: AppContainer(
              fillColor: AppColorsScheme.white,
              borderRadius: BorderRadius.zero,
              child: Row(
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
                          height: 20.h,
                          width: 30.w,
                          child: ColoredBox(
                            color: AppColorsScheme.grey4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppMargin.mediumMargin.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            height: 3.h,
                            width: 30.w,
                            child: ColoredBox(
                              color: AppColorsScheme.grey4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppMargin.smallMargin.h),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            height: 3.h,
                            width: 35.w,
                            child: ColoredBox(
                              color: AppColorsScheme.grey4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppMargin.smallMargin.h),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            height: 12.h,
                            width: 55.w,
                            child: ColoredBox(
                              color: AppColorsScheme.grey4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
