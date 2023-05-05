import 'package:sizer/sizer.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/base/base_dialog.dart';
import '../../widgets/base/base_title.dart';
import 'widgets/books_cards.dart';
import 'widgets/category.dart';
import 'widgets/categories.dart';
import '../../widgets/base/base_loader.dart';
import '../../../../ui.dart';
import 'bloc/bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
          curr is NavigateToBookDetailState ||
          curr is ErrorState ||
          curr is NavigateToBooksState,
      buildWhen: (prev, curr) => curr is FetchedState || curr is LoadingState,
      listener: (context, state) {
        if (state is ErrorState) {
          BaseDialog.showSnackBar(
            context,
            text: state.error.message?.toString() ?? '!!!',
          );
        }
        if (state is NavigateToBooksState) {
          context.router.push(BooksPageRoute(books: state.books));
        }
        if (state is NavigateToBookDetailState) {
          context.router.push(BookDetailPageRoute(book: state.book));
        }
      },
      builder: (context, state) => state.maybeWhen(
        fetched: (booksByCategories, categories, books, newBooks) => Padding(
          padding: EdgeInsets.only(
            top: AppPadding.mediumPadding.h,
            bottom: AppPadding.mediumPadding.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: AppPadding.largePadding.w, bottom: AppPadding.mediumPadding.h),
                      child: BaseText(title: 'Новинки', style: context.theme.textTheme.headlineLarge?.toBold()),
                    ),
                    BookCards(
                      books: newBooks,
                      onTap: ({required String bookId}) {
                        context.read<HomeBloc>().add(ChooseBookEvent(bookId));
                      },
                      withBorder: true,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppPadding.mediumPadding.h,
                    left: AppPadding.largePadding.w,
                    right: AppPadding.largePadding.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        title: 'Жанры',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.toBold(),
                      ),
                      BaseText(
                        title: 'Показать все',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.toBold()
                            .withColor(AppColorsScheme.mainColor),
                        onTap: () {
                          context.router
                              .parent<TabsRouter>()
                              ?.setActiveIndex(1);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: AppMargin.smallMargin.h),
                Categories(
                  categories: categories,
                  onCategoryTap: ({required int categoryId}) =>
                      context.read<HomeBloc>().add(
                            HomeEvent.onShowAllTap(
                              categories
                                  .firstWhere(
                                    (element) => element.id == categoryId,
                                  )
                                  .id,
                            ),
                          ),
                ),
                SizedBox(height: AppMargin.mediumMargin.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: booksByCategories.categoriesBooks.length,
                  itemBuilder: (context, index) {
                    return BookCategory(
                      id: booksByCategories
                          .categoriesBooks[index].bookCategory.id,
                      title: booksByCategories
                          .categoriesBooks[index].bookCategory.title,
                      books: booksByCategories.categoriesBooks[index].books,
                      onBookTap: ({required String bookId}) {
                        context.read<HomeBloc>().add(ChooseBookEvent(bookId));
                      },
                      onShowAllTap: ({required int categoryId}) =>
                          context.read<HomeBloc>().add(
                                HomeEvent.onShowAllTap(
                                  booksByCategories
                                      .categoriesBooks[index].bookCategory.id,
                                ),
                              ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        orElse: () => const BaseLoader(),
      ),
    );
  }
}
