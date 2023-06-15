import '../../../../injection/injection.dart';
import '../../presentation.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/book/view_book_card.dart';
import '../search/widgets/search_items_shimmer.dart';
import 'bloc/bloc.dart';

@RoutePage()
class BooksPage extends StatefulWidget implements AutoRouteWrapper {
  final int categoryId;

  const BooksPage({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<BooksBloc>(
      create: (_) => getIt<BooksBloc>()
        ..add(
          BooksEvent.fetch(
            id: categoryId,
          ),
        ),
      child: this,
    );
  }

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => BaseScaffold(
        backgroundColor: AppColorsScheme.grey4,
        appBarTitle: 'Ужасы',
        body: RefreshIndicator(
          onRefresh: () async => context
              .read<BooksBloc>()
              .add(BooksEvent.fetch(id: widget.categoryId)),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<BooksBloc, BooksState>(
                  listenWhen: (prev, curr) => curr is BooksFetchedState,
                  buildWhen: (prev, curr) =>
                      curr is BooksInitState ||
                      curr is BooksFetchedState ||
                      curr is BooksLoadingState,
                  listener: (BuildContext context, state) => state.maybeWhen(
                    orElse: () {
                      return null;
                    },
                    fetched: (books) {
                      _scrollController.addListener(
                        () {
                          if (_scrollController.position.pixels >=
                              _scrollController.position.maxScrollExtent) {
                            context.read<BooksBloc>().add(
                                  BooksEvent.fetch(
                                    id: widget.categoryId,
                                    books: books,
                                  ),
                                );
                          }
                        },
                      );
                      return null;
                    },
                  ),
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => const BaseLoader(),
                    loading: () => const SearchBooksShimmer(),
                    fetched: (books) => Scrollbar(
                      controller: _scrollController,
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: books.items.length,
                        itemBuilder: (context, index) {
                          Widget item = AppContainer(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 8,
                            ),
                            onTap: () async => await context.router
                                .push<BookUiModel>(
                              BookDetailPageRoute(
                                bookId: books.items[index].id,
                              ),
                            )
                                .then(
                              (book) {
                                if (book != null) {
                                  context.read<BooksBloc>().add(
                                      BooksEvent.updateBook(
                                          book: book, books: books));
                                }
                              },
                            ),
                            margin: index == 0
                                ? EdgeInsets.only(
                                    top: AppMargin.smallMargin.h,
                                    bottom: AppMargin.smallMargin.h,
                                    right: AppMargin.largeMargin.w,
                                    left: AppMargin.largeMargin.w,
                                  )
                                : EdgeInsets.only(
                                    bottom: AppMargin.smallMargin.h,
                                    right: AppMargin.largeMargin.w,
                                    left: AppMargin.largeMargin.w,
                                  ),
                            child: ViewBookCard(
                              book: books.items[index],
                              onFavoriteTap: () =>
                                  context.read<BooksBloc>().add(
                                        BooksEvent.onFavoriteTap(
                                          id: books.items[index].id,
                                          books: books,
                                        ),
                                      ),
                            ),
                          );
                          if (index == books.items.length - 1) {
                            item = Column(
                              children: [
                                item,
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: BaseLoader(),
                                ),
                              ],
                            );
                          }
                          return item;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
