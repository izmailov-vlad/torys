import '../../../../injection/injection.dart';
import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import 'bloc/bloc.dart';

@RoutePage()
class WishesScreen extends StatelessWidget implements AutoRouteWrapper {
  const WishesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      emptyTop: true,
      body: BlocConsumer<WishesBloc, WishesState>(
        listenWhen: (prev, curr) => curr is WishesSavedState,
        buildWhen: (prev, curr) =>
            curr is WishesLoadingState ||
            curr is WishesFetchedState ||
            curr is WishesCategoriesSelectedState,
        listener: (context, state) {
          if (state is WishesSavedState) {
            context.router.replace(const MainScreenRoute());
            context.router.push(const HomeScreenRoute());
          }
        },
        builder: (context, state) => state.maybeWhen(
          orElse: () => const BaseLoader(),
          fetched: (selectedCategories, categories) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppPadding.largePadding.w),
                child: BaseText(
                  title: 'Выберите наиболее интересные вам жанры',
                  style: context.theme.textTheme.displayLarge?.toBold(),
                  maxLines: 2,
                ),
              ),
              SizedBox(height: AppMargin.mediumMargin.h),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.largePadding.w,
                      ),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppMargin.smallMargin.h,
                          crossAxisSpacing: AppMargin.mediumMargin.w,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return AppAnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            onTap: () => context.read<WishesBloc>().add(
                                  WishesEvent.onCategoryTap(
                                    id: categories[index].id,
                                    selectedCategories: selectedCategories,
                                    categories: categories,
                                  ),
                                ),
                            withBorder: true,
                            fillColor:
                                selectedCategories[categories[index].id] ??
                                        false
                                    ? AppColorsScheme.mainColor
                                    : AppColorsScheme.white,
                            borderColor: AppColorsScheme.mainColor,
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: BaseText(
                                title: categories[index].title,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.headlineLarge
                                    ?.withColor(
                                  selectedCategories[categories[index].id] ??
                                          false
                                      ? AppColorsScheme.white
                                      : AppColorsScheme.mainColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: BaseButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.mediumPadding.w),
                          onPressed: () => context.read<WishesBloc>().add(
                                WishesEvent.save(
                                  selectedCategories: selectedCategories,
                                ),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: BaseText(title: 'Сохранить'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WishesBloc>(
      create: (_) => getIt<WishesBloc>()..add(WishesLoadEvent()),
      child: this,
    );
  }
}
