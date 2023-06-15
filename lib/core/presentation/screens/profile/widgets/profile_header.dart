import '../../../presentation.dart';
import '../../../router/auto_router.gr.dart';
import '../bloc/bloc.dart';
import 'profile_photo.dart';
import 'dart:convert' show utf8, base64;

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? profilePhoto;
  final VoidCallback onPhotoEditTap;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.email,
    required this.onPhotoEditTap,
    this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.largePadding.w,
        vertical: AppPadding.largePadding.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BaseIcon(
                icon: Icon(Icons.delete),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (_) => context.read<ProfileBloc>(),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(
                            title: 'Вы уверены что хотите удалить аккаунт?',
                            style:
                                context.theme.textTheme.headlineLarge?.toBold(),
                            maxLines: 2,
                          ),
                          SizedBox(height: AppMargin.mediumMargin.h),
                          Row(
                            children: [
                              Expanded(
                                child: BaseButton(
                                  onPressed: () {
                                    context.router.pop();
                                    context.read<ProfileBloc>().add(
                                          const ProfileEvent.delete(),
                                        );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: BaseText(
                                      title: 'Удалить',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppMargin.mediumMargin.h),
                          Row(
                            children: [
                              Expanded(
                                child: AppContainer(
                                  padding: EdgeInsets.all(16),
                                  withBorder: true,
                                  borderColor: AppColorsScheme.mainColor,
                                  child: BaseText(
                                    title: 'Отмена',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ProfilePhoto(
                        imagePath: profilePhoto,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: AppContainer(
                          fillColor: AppColorsScheme.secondary4,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                            right: AppMargin.mediumMargin.w,
                            bottom: AppMargin.mediumMargin.h,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          withBorder: true,
                          borderColor: context.theme.primaryColor,
                          child: BaseImage(
                            imageType: ImageType.asset,
                            imagePath: AppImages.icEdit,
                            onTap: () => onPhotoEditTap(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppMargin.smallMargin.h),
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
                  AppContainer(
                    onTap: () => context.router
                        .push<UserUiModel>(const ProfileEditScreenRoute())
                        .then(
                          (value) => context.read<ProfileBloc>().add(
                                const ProfileEvent.load(),
                              ),
                        ),
                    padding: EdgeInsets.all(16),
                    borderColor: context.theme.primaryColor,
                    withBorder: true,
                    child: BaseText(
                      title: 'Редактировать профиль',
                      style: context.theme.textTheme.headlineLarge?.withColor(
                        AppColorsScheme.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
