import '../../../../utils/app_logger.dart';
import '../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';
import 'widgets/body/profile_item_page.dart';

import 'widgets/body/profile_statistics.dart';
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
            logout: () {
              context.router.replace(const AuthorizationScreenRoute());
            },
            orElse: () => AppLogger.log(message: 'unknown event'),
          );
        },
        builder: (context, state) => state.maybeWhen(
          init: () => const BaseLoader(),
          fetched: (user) => Column(
            children: [
              ProfileHeader(
                name: user.name,
                email: user.email,
              ),
              SizedBox(height: AppPadding.mediumPadding.h),
              Expanded(
                child: AppContainer(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ProfileStatistics(),
                        ProfileItemPage(
                          title: 'Настройки',
                          onTap: () {},
                        ),
                        BaseButton(
                          onPressed: () => context
                              .read<ProfileBloc>()
                              .add(const ProfileEvent.logout()),
                          child: const BaseText(
                            title: 'Выйти',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          orElse: () => const BaseLoader(),
        ),
      ),
    );
  }
}
