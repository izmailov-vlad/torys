import 'package:book_readers/core/presentation/screens/home/widgets/shimmers/books_shimmer.dart';
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
import 'package:shimmer_animation/shimmer_animation.dart';

import 'widgets/shimmers/big_book_card_shimmer.dart';
import 'widgets/shimmers/books_with_border_shimmer.dart';
import 'widgets/shimmers/categories_shimmer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
          curr is NavigateToBookDetailState ||
          curr is ErrorState ||
          curr is NavigateToBooksState,
      listener: (context, state) {
        if (state is ErrorState) {
          BaseDialog.showSnackBar(
            context,
            text: state.error.message?.toString() ?? '!!!',
          );
        }
        if (state is NavigateToBooksState) {
          context.router.push(BooksPageRoute(categoryId: state.categoryId));
        }
        if (state is NavigateToBookDetailState) {
          context.router.push(BookDetailPageRoute(bookId: state.book.id));
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (prev, curr) =>
                      curr is LoadingState || curr is FetchedNewBooksState,
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => const BaseLoader(),
                    loading: () => AppContainer(
                        padding: EdgeInsets.only(
                          bottom: AppPadding.mediumPadding.h,
                          top: AppPadding.mediumPadding.h,
                        ),
                        child: const BookWithBorderShimmer()),
                    fetchedNewBooks: (books) => AppContainer(
                      padding: EdgeInsets.only(
                        bottom: AppPadding.mediumPadding.h,
                        top: AppPadding.mediumPadding.h,
                      ),
                      child: BookCards(
                        books: books,
                        onTap: ({required String bookId}) {
                          context.read<HomeBloc>().add(ChooseBookEvent(bookId));
                        },
                        withBorder: true,
                        category: BookCategory(
                          title: 'Новинки',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: AppPadding.mediumPadding.h),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (prev, curr) =>
                  curr is LoadingState || curr is FetchedCategoriesState,
              builder: (context, state) => state.maybeWhen(
                orElse: () => const BaseLoader(),
                loading: () => const CategoryShimmer(),
                fetchedCategories: (categories) => Categories(
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
              ),
            ),
            SizedBox(height: AppPadding.mediumPadding.h),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (prev, curr) =>
                  curr is LoadingState || curr is FetchedPopularBooksState,
              builder: (context, state) => state.maybeWhen(
                orElse: () => const BaseLoader(),
                loading: () => AppContainer(
                  padding: EdgeInsets.only(
                    bottom: AppPadding.mediumPadding.h,
                    top: AppPadding.mediumPadding.h,
                  ),
                  child: const BigBookCardShimmer(),
                ),
                fetchedPopularBooks: (books) => AppContainer(
                  padding: EdgeInsets.only(
                    bottom: AppPadding.mediumPadding.h,
                    top: AppPadding.mediumPadding.h,
                  ),
                  child: BookCards(
                    bigCard: true,
                    books: books,
                    onTap: ({required String bookId}) {
                      context.read<HomeBloc>().add(ChooseBookEvent(bookId));
                    },
                    category: BookCategory(
                      title: 'Популярное',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppPadding.mediumPadding.h),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (prev, curr) =>
                  curr is LoadingState || curr is FetchedBooksByCategoriesState,
              builder: (context, state) => state.maybeWhen(
                orElse: () => const BaseLoader(),
                loading: () => ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return BooksShimmer();
                  },
                ),
                fetchedBooksByCategories: (booksByCategories) =>
                    ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: booksByCategories.categoriesBooks.length,
                  itemBuilder: (context, index) {
                    return AppContainer(
                      padding: index == 0
                          ? EdgeInsets.only(
                              bottom: AppPadding.mediumPadding.h,
                              top: AppPadding.mediumPadding.h,
                            )
                          : EdgeInsets.only(
                              bottom: AppPadding.mediumPadding.h,
                            ),
                      child: BookCards(
                        category: BookCategory(
                          id: booksByCategories
                              .categoriesBooks[index].bookCategory.id,
                          title: booksByCategories
                              .categoriesBooks[index].bookCategory.title,
                          onShowAllTap: ({required int categoryId}) =>
                              context.read<HomeBloc>().add(
                                    HomeEvent.onShowAllTap(
                                      booksByCategories.categoriesBooks[index]
                                          .bookCategory.id,
                                    ),
                                  ),
                        ),
                        books: booksByCategories.categoriesBooks[index].books,
                        onTap: ({required String bookId}) {
                          context.read<HomeBloc>().add(ChooseBookEvent(bookId));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
