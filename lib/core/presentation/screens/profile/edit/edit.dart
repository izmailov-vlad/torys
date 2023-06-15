import '../../../../../injection/injection.dart';
import '../../../presentation.dart';
import 'bloc/bloc.dart';

@RoutePage<UserUiModel>()
class ProfileEditScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileEditBloc>(
      create: (_) => getIt<ProfileEditBloc>()
        ..add(
          const ProfileEditEvent.init(),
        ),
      child: this,
    );
  }
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Назад',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppMargin.mediumMargin.w,
          vertical: AppMargin.mediumMargin.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppContainer(
                borderColor: AppColorsScheme.grey1,
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.mediumPadding.w,
                  vertical: AppPadding.largePadding.w,
                ),
                child: BlocConsumer<ProfileEditBloc, ProfileEditState>(
                  buildWhen: (prev, curr) => curr is ProfileEditFetchState,
                  listenWhen: (prev, curr) =>
                      curr is ProfileEditFetchState ||
                      curr is ProfileEditNavigateBackState,
                  listener: (context, state) => state.maybeWhen(
                    orElse: () {
                      return null;
                    },
                    navigateBackState: (user) => context.router.pop(user),
                    fetch: (user) {
                      nameController.text = user.name;
                      emailController.text = user.email;
                      return null;
                    },
                  ),
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => BaseLoader(),
                      fetch: (user) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            title: 'Мои данные',
                            style:
                                context.theme.textTheme.headlineLarge?.toBold(),
                          ),
                          SizedBox(height: AppMargin.mediumMargin.h),
                          BaseInputTextField(
                            hintText: ' ФИО',
                            headTitle: 'Имя Фамилия',
                            controller: nameController,
                          ),
                          SizedBox(height: AppMargin.mediumMargin.h),
                          BaseInputTextField(
                            hintText: 'Введите email',
                            headTitle: 'Email',
                            controller: emailController,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: AppMargin.mediumMargin.h),
            Row(
              children: [
                Expanded(
                  child: BaseButton(
                    onPressed: () => context.read<ProfileEditBloc>().add(
                          ProfileEditEvent.save(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                        ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: BaseText(
                        title: 'Сохранить',
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
  }
}
