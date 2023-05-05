import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';
import '../../../widgets/app_container.dart';
import '../../../widgets/base/base_image.dart';
import '../../../widgets/base/base_title.dart';
import 'profile_photo.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.largePadding.w,
          vertical: AppPadding.largePadding.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:
                  ProfilePhoto(imagePath: AppImages.profilePersonPlaceholder),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    title: name,
                    style: Theme.of(context).textTheme.headlineLarge?.toBold(),
                  ),
                  SizedBox(height: AppMargin.smallMargin.h),
                  BaseText(
                    title: email,
                    style: Theme.of(context).textTheme.headlineLarge?.toBold(),
                  ),
                  SizedBox(height: AppMargin.smallMargin.h),
                  // Row(
                  //   children: [
                  //     BaseText(
                  //       title: 'ID 37373737',
                  //       style: Theme.of(context).textTheme.headlineLarge,
                  //     ),
                  //     SizedBox(width: AppMargin.smallMargin.w),
                  //     BaseImage(
                  //       imageType: ImageType.asset,
                  //       imagePath: AppImages.contentCopy,
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
