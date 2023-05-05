import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';

@RoutePage()
class LaunchScreen extends StatelessWidget implements AutoRouteWrapper {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      emptyTop: true,
      body: BlocListener<LaunchBloc, LaunchState>(
        listenWhen: (prev, curr) => curr is NavigateToState,
        listener: (context, state) {
          state.maybeWhen(
            navigateTo: (route) {
              if (route == NavigateToRoute.auth) {
                context.router.replace(const AuthorizationScreenRoute());
              } else if (route == NavigateToRoute.main) {
                context.router.replace(const MainScreenRoute());
                context.router.push(HomeScreenRoute());
              }
            },
            orElse: () {},
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Splash Screen'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return AppProvider(child: this);
  }
}
