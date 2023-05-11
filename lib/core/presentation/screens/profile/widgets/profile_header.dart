import 'package:sizer/sizer.dart';

import '../../../../../ui.dart';
import '../../../router/auto_router.gr.dart';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ProfilePhoto(
                      imagePath: AppImages.profilePersonPlaceholder,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: AppContainer(
                        fillColor: AppColorsScheme.secondary4,
                        padding: EdgeInsets.all(4),
                        borderRadius: BorderRadius.circular(30),
                        withBorder: true,
                        borderColor: context.theme.primaryColor,
                        child: BaseImage(
                          imageType: ImageType.asset,
                          imagePath: AppImages.icEdit,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseText(
                      title: name,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.toBold(),
                    ),
                    SizedBox(height: AppMargin.smallMargin.h),
                    BaseText(
                      title: email,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.toBold(),
                    ),
                    SizedBox(height: AppMargin.smallMargin.h),
                    AppContainer(
                      onTap: () =>
                          context.router.push(const ProfileEditScreenRoute()),
                      padding: EdgeInsets.all(16),
                      borderColor: context.theme.primaryColor,
                      withBorder: true,
                      child: BaseText(
                        title: 'Редактировать профиль',
                        style: context.theme.textTheme.headlineLarge?.withColor(
                          AppColorsScheme.mainColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
