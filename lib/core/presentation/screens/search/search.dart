import 'dart:async';

import 'package:sizer/sizer.dart';

import '../../../../ui.dart';
import '../../../../utils/app_logger.dart';
import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/base/base_icon.dart';
import '../../widgets/base/base_input_text_field.dart';
import '../../widgets/base/base_loader.dart';
import '../../widgets/base/base_title.dart';
import '../books/widgets/book_list_item.dart';
import 'bloc/bloc.dart';
import 'book_search_bloc/bloc.dart';
import 'widgets/categories_list.dart';

@RoutePage()
class SearchScreen extends StatelessWidget implements AutoRouteWrapper {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return AppProvider(child: this);
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
        listener: (context, state) {
          state.maybeWhen(
            navigateToBooksByCategory: (books) => context.router.push(
              BooksPageRoute(books: books),
            ),
            orElse: () => AppLogger.log(message: 'undefined state'),
          );
        },
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
                      onEraseTap: () => context.read<BookSearchBloc>().add(
                            const BookSearchFindByQuery(
                              query: '',
                            ),
                          ),
                    ),
                    orElse: () => _SearchBooksField(
                      show: false,
                      onEraseTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      _Body(categories: categories),
                      BlocBuilder<BookSearchBloc, BookSearchState>(
                        buildWhen: (prev, curr) =>
                            curr is BookSearchBooksFetchedState,
                        builder: (context, state) => state.maybeWhen(
                          booksFetched: (books) => _SearchListView(
                            books: books,
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

class _SearchBooksField extends StatefulWidget {
  final bool show;
  final VoidCallback? onEraseTap;

  const _SearchBooksField({Key? key, required this.show, this.onEraseTap})
      : super(key: key);

  @override
  State<_SearchBooksField> createState() => _SearchBooksFieldState();
}

class _SearchBooksFieldState extends State<_SearchBooksField> {
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

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
        controller: _controller,
        hintText: 'Введите название книги или автора',
        suffixIcon: widget.show
            ? BaseIcon(
                icon: const Icon(Icons.close),
                onTap: () {
                  context.unfocus();
                  _controller.clear();
                  if (widget.onEraseTap != null) widget.onEraseTap!();
                },
              )
            : null,
        onChanged: (text) {
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

class _SearchListView extends StatelessWidget {
  final BooksUiModel books;

  const _SearchListView({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: BlocBuilder<BookSearchBloc, BookSearchState>(
        builder: (context, state) => state.maybeWhen(
          listState: (show) => AnimatedContainer(
            color: AppColorsScheme.grey4,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: show ? context.screenSize.height : 0,
            child: ListView.builder(
              itemCount: books.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? AppPadding.mediumPadding.h : 0,
                    bottom: AppPadding.mediumPadding.h,
                    right: AppPadding.bigPadding.w,
                    left: AppPadding.bigPadding.w,
                  ),
                  child: BookListItem(
                    title: books.items[index].title,
                    author: books.items[index].authors.isNotEmpty
                        ? books.items[index].authors.first
                        : '',
                    publishYear: 2022,
                    description: books.items[index].description,
                    imageUrl: books.items[index].imageLinks.isNotEmpty
                        ? books.items[index].imageLinks.first
                        : '',
                    isFavorite: false,
                    onFavoriteTap: () {},
                    onTap: () {
                      context.router.push(
                        BookDetailPageRoute(book: books.items[index]),
                      );
                    },
                  ),
                );
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
                context.read<SearchBloc>().add(
                      OnCategoryTap(id: id),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
