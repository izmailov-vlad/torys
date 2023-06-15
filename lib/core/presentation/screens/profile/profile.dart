import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import '../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';
import '../../presentation.dart';
import 'widgets/profile_header.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return AppProvider(child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        buildWhen: (prev, curr) =>
            curr is ProfileInitState || curr is FetchedState,
        listenWhen: (prev, curr) => curr is LogoutState,
        listener: (context, state) {
          state.maybeWhen(
            showPhotoSelectionModal: () {},
            logout: () {
              context.router.replace(const AuthorizationScreenRoute());
            },
            orElse: () => AppLogger.log(message: 'unknown event'),
          );
        },
        builder: (context, state) => state.maybeWhen(
          init: () => const BaseLoader(),
          fetched: (user) => AppContainer(
            child: Column(
              children: [
                ProfileHeader(
                  name: user.name,
                  email: user.email,
                  profilePhoto: user.photo,
                  onPhotoEditTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (innerContext) {
                        return BlocProvider<ProfileBloc>(
                          create: (BuildContext context) =>
                              context.read<ProfileBloc>(),
                          child: AppContainer(
                            height: context.screenSize.height * 0.2,
                            child: Column(
                              children: [
                                SizedBox(height: AppMargin.largeMargin.w),
                                AppContainer(
                                  onTap: () async {
                                    final cameras = await availableCameras();
                                    context.router
                                        .push(
                                          TakePhotoScreenRoute(
                                            backCamera: cameras[0],
                                            frontCamera: cameras[1],
                                          ),
                                        )
                                        .then(
                                          (value) =>
                                              context.read<ProfileBloc>().add(
                                                    const ProfileEvent.load(),
                                                  ),
                                        );
                                  },
                                  fillColor: context.theme.primaryColor,
                                  padding: const EdgeInsets.all(16),
                                  child: BaseText(
                                    style: context.theme.textTheme.headlineLarge
                                        ?.withColor(AppColorsScheme.white),
                                    title: 'Сделать фото',
                                  ),
                                ),
                                SizedBox(height: AppMargin.largeMargin.w),
                                AppContainer(
                                  withBorder: true,
                                  borderColor: AppColorsScheme.mainColor,
                                  padding: const EdgeInsets.all(16),
                                  onTap: () async {
                                    XFile? pickedFile =
                                        await ImagePicker().pickImage(
                                      source: ImageSource.gallery,
                                      maxWidth: 1800,
                                      maxHeight: 1800,
                                    );
                                    if (pickedFile != null) {
                                      context.read<ProfileBloc>().add(
                                            ProfileEvent.updatePhoto(
                                                photoPath: pickedFile.path,
                                                photoName: pickedFile.name),
                                          );
                                    }
                                  },
                                  child: BaseText(
                                    style: context.theme.textTheme.headlineLarge
                                        ?.withColor(
                                      AppColorsScheme.mainColor,
                                    ),
                                    title: 'Открыть галлерею',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                AppContainer(
                  onTap: () => context.read<ProfileBloc>().add(
                        const ProfileEvent.logout(),
                      ),
                  margin: EdgeInsets.only(left: AppMargin.largeMargin.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BaseImage(
                        imageType: ImageType.asset,
                        imagePath: AppImages.icLogout,
                      ),
                      SizedBox(width: AppMargin.smallMargin.w),
                      const BaseText(
                        title: 'Выйти',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          orElse: () => const BaseLoader(),
        ),
      ),
    );
  }
}
