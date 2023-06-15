import 'dart:async';
import '../../../../utils/app_logger.dart';
import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/base/base_icon.dart';
import '../../widgets/book/view_book_card.dart';
import 'bloc/bloc.dart';
import 'book_search_bloc/bloc.dart';
import 'widgets/categories_list.dart';
import 'widgets/search_items_shimmer.dart';

@RoutePage()
class SearchScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return AppProvider(child: this);
  }
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? _debounce;
  final controller = TextEditingController();
  final scrollController = ScrollController();

  @override
  void dispose() {
    _debounce?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColorsScheme.grey4,
      body: BlocConsumer<SearchBloc, SearchState>(
        listenWhen: (prev, curr) =>
            curr is SearchNavigateToBooksByCategoryState,
        buildWhen: (prev, curr) =>
            curr is SearchInitState ||
            curr is SearchFetchedState ||
            curr is SearchErrorState,
        listener: (context, state) => state.maybeWhen(
          navigateToBooksByCategory: (categoryId) => context.router.push(
            BooksPageRoute(categoryId: categoryId),
          ),
          orElse: () => AppLogger.log(message: 'undefined state'),
        ),
        builder: (context, state) {
          return state.maybeWhen(
            init: () => const BaseLoader(),
            fetched: (categories) => Column(
              children: [
                BlocBuilder<BookSearchBloc, BookSearchState>(
                  buildWhen: (prev, curr) => curr is BookSearchListState,
                  builder: (context, state) => state.maybeWhen(
                    listState: (show) => _SearchBooksField(
                      show: show,
                      onEraseTap: () {
                        controller.text = '';
                        context.read<BookSearchBloc>().add(
                              const BookSearchFindByQuery(
                                query: '',
                              ),
                            );
                      },
                      controller: controller,
                      onChanged: (String text) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 500),
                          () {
                            context.read<BookSearchBloc>().add(
                                  BookSearchEvent.findByQuery(query: text),
                                );
                          },
                        );
                      },
                    ),
                    orElse: () => _SearchBooksField(
                      show: false,
                      onEraseTap: () {},
                      controller: controller,
                      onChanged: (String text) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 500),
                          () {
                            context.read<BookSearchBloc>().add(
                                  BookSearchEvent.findByQuery(query: text),
                                );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      _Body(categories: categories),
                      BlocBuilder<BookSearchBloc, BookSearchState>(
                        buildWhen: (prev, curr) =>
                            curr is BookSearchBooksFetchedState ||
                            curr is BookLoadingState,
                        builder: (context, state) => state.maybeWhen(
                          booksLoading: () => const SearchBooksShimmer(),
                          booksFetched: (books) => _SearchListView(
                            books: books,
                            textEditingController: controller,
                            refresh: () {
                              context.read<BookSearchBloc>().add(
                                    BookSearchEvent.findByQuery(
                                      books: books,
                                      query: controller.text,
                                    ),
                                  );
                            },
                            scrollController: scrollController,
                          ),
                          orElse: () => const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            orElse: () => const BaseLoader(),
          );
        },
      ),
    );
  }
}

class _SearchBooksField extends StatelessWidget {
  final bool show;
  final VoidCallback? onEraseTap;
  final Function(String text) onChanged;
  final TextEditingController controller;

  const _SearchBooksField({
    Key? key,
    required this.show,
    this.onEraseTap,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(0),
      ),
      child: BaseInputTextField(
        controller: controller,
        hintText: 'Введите название книги или автора',
        suffixIcon: show
            ? BaseIcon(
                icon: const Icon(Icons.close),
                onTap: () {
                  context.unfocus();
                  if (onEraseTap != null) onEraseTap!();
                },
              )
            : null,
        onChanged: (text) => onChanged(text),
        withBorder: false,
        filled: true,
        fillColor: AppColorsScheme.grey4,
        prefixIcon: const Icon(
          Icons.search,
        ),
      ),
    );
  }
}

class _SearchListView extends StatefulWidget {
  final BooksUiModel books;
  final TextEditingController textEditingController;
  final VoidCallback refresh;
  final ScrollController scrollController;

  const _SearchListView({
    Key? key,
    required this.books,
    required this.textEditingController,
    required this.refresh,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<_SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<_SearchListView> {
  @override
  void initState() {
    super.initState();
    if (widget.scrollController.hasClients) return;
    widget.scrollController.addListener(
      () {
        if (widget.scrollController.position.pixels >=
            widget.scrollController.position.maxScrollExtent) {
          widget.refresh();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: BlocConsumer<BookSearchBloc, BookSearchState>(
        buildWhen: (prev, curr) => curr is BookSearchListState,
        listenWhen: (prev, curr) => curr is BookSearchBooksFetchedState,
        listener: (context, state) => state.maybeWhen(
          orElse: () {
            return null;
          },
        ),
        builder: (context, state) => state.maybeWhen(
          listState: (show) => AnimatedContainer(
            color: AppColorsScheme.grey4,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: show ? context.screenSize.height : 0,
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: widget.books.items.length,
              itemBuilder: (context, index) {
                Widget item = Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? AppMargin.smallMargin.h : 0,
                    bottom: AppMargin.smallMargin.h,
                    right: AppMargin.largeMargin.w,
                    left: AppMargin.largeMargin.w,
                  ),
                  child: AppContainer(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    onTap: () {
                      context.router.push(
                        BookDetailPageRoute(
                            bookId: widget.books.items[index].id),
                      );
                    },
                    child: ViewBookCard(
                      book: widget.books.items[index],
                      onFavoriteTap: () => context.read<BookSearchBloc>().add(
                            BookSearchEvent.onFavoriteTap(
                              bookId: widget.books.items[index].id,
                              books: widget.books,
                            ),
                          ),
                    ),
                  ),
                );
                if (index == widget.books.items.length - 1) {
                  item = Column(
                    children: [
                      item,
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: BaseLoader(),
                      ),
                    ],
                  );
                }
                return item;
              },
            ),
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<CategoryUIModel> categories;

  const _Body({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.normalPadding.h,
        horizontal: AppPadding.mediumPadding.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              title: 'Жанры',
              style: Theme.of(context).textTheme.displayLarge?.toBold(),
            ),
            SizedBox(height: AppMargin.mediumMargin.h),
            CategoriesListView(
              categories: categories,
              onCategoryTap: ({required int id}) {
                context.router.push(
                  BooksPageRoute(categoryId: id),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
