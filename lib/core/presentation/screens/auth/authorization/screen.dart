import '../../../widgets/base/base_web_view.dart';
import 'widgets/google_auth_button.dart';
import 'package:flutter/gestures.dart';
import '../../../widgets/base/base_dialog.dart';
import 'bloc/bloc.dart';
import 'widgets/user_input_data.dart';
import '../../../../../ui.dart';
import '../../../router/auto_router.gr.dart';
import '../../../widgets/base/base_rich_text.dart';
import '../../../widgets/base/base_title.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return AppProvider(child: this);
  }
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listenWhen: (prev, curr) =>
          curr is AuthorizationSuccessState ||
          curr is AuthorizationErrorState ||
          curr is RegistrationSuccessState ||
          curr is AuthorizationGoogleAuthSuccessState|| curr is AuthorizatioNavigateToWishesState,
      listener: (context, state) {
        if(state is AuthorizatioNavigateToWishesState) {
          context.router.replace(const WishesScreenRoute());
        }
        if (state is AuthorizationGoogleAuthSuccessState) {
          context.router.push(BaseWebViewRoute(initialUrl: state.url));
        }
        if (state is AuthorizationErrorState) {
          BaseDialog.showSnackBar(
            context,
            text: 'User not found',
          );
        }

        if (state is AuthorizationSuccessState ||
            state is RegistrationSuccessState) {
          context.router.replace(const MainScreenRoute());
        }
      },
      child: BaseScaffold(
        emptyTop: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
                  buildWhen: (prev, curr) =>
                      curr is AuthorizationInitState ||
                      curr is ChangeScreenState,
                  builder: (context, state) {
                    return state.maybeWhen(
                      init: () => const _AuthorizationContent(
                        screenState: ScreenState.authorization,
                      ),
                      changeScreenState: (screenState) =>
                          _AuthorizationContent(screenState: screenState),
                      orElse: () => const _AuthorizationContent(
                        screenState: ScreenState.authorization,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 78.0),
                child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      init: () => const _AuthorizationPolicy(
                        screenState: ScreenState.authorization,
                      ),
                      changeScreenState: (screenState) =>
                          _AuthorizationPolicy(screenState: screenState),
                      orElse: () => const _AuthorizationPolicy(
                        screenState: ScreenState.authorization,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthorizationPolicy extends StatelessWidget {
  final ScreenState screenState;

  const _AuthorizationPolicy({Key? key, required this.screenState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseRichText(
      text: 'Нет аккаунта?',
      defaultTextStyle: Theme.of(context).textTheme.bodyLarge,
      children: [
        TextSpan(
          text: screenState == ScreenState.authorization
              ? ' Зарегистрироваться'
              : ' Войти',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.withColor(AppColorsScheme.mainColor),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              screenState == ScreenState.authorization
                  ? context.read<AuthorizationBloc>().add(
                        const AuthorizationChangeScreenStateEvent(
                          ScreenState.registration,
                        ),
                      )
                  : context.read<AuthorizationBloc>().add(
                        const AuthorizationChangeScreenStateEvent(
                          ScreenState.authorization,
                        ),
                      );
            },
        ),
      ],
    );
  }
}

class _AuthorizationContent extends StatelessWidget {
  final ScreenState screenState;

  const _AuthorizationContent({
    Key? key,
    required this.screenState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = screenState == ScreenState.authorization
        ? 'Вход'
        : 'Зарегистрироваться';
    final policyTitle = screenState == ScreenState.authorization
        ? 'Нажимая “Вход”, вы принимаете условия\n'
        : 'Регистрируясь, вы принимаете условия\n';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: BaseText(
            animated: true,
            title: title,
            style: Theme.of(context).textTheme.displayLarge?.toBold(),
          ),
        ),
        const SizedBox(height: 32),
        UserInputData(screenState: screenState),
        const SizedBox(height: 24),
        BaseRichText(
          children: [
            TextSpan(
              text: policyTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextSpan(
              text: 'Политики конфиденциальности',
              style: Theme.of(context).textTheme.titleLarge?.toBold(),
            )
          ],
        ),
        GoogleAuthButton(
          onPressed: () => context.read<AuthorizationBloc>().add(
                const AuthorizationEvent.googleAuth(),
              ),
        ),
      ],
    );
  }
}
