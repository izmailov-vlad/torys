import 'dart:ui';

import 'gpt_bloc/bloc.dart';
import 'widget/comment_modal.dart';
import '../../../../injection/injection.dart';
import '../../presentation.dart';
import 'bloc/bloc.dart';
import 'widget/book_detail_app_bar.dart';
import 'widget/book_detail_body/book_detail_body_container.dart';
import 'widget/book_detail_body/book_detail_footer_container.dart';

@RoutePage<BookUiModel>()
class BookDetailPage extends StatelessWidget implements AutoRouteWrapper {
  final String bookId;

  const BookDetailPage({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<BookDetailBloc>(
            create: (_) => getIt<BookDetailBloc>()
              ..add(
                BookDetailEvent.init(id: bookId),
              ),
          ),
          BlocProvider<ChatGptBloc>(
            create: (_) => getIt<ChatGptBloc>()
              ..add(
                const ChatGptEvent.init(),
              ),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      bottomSafe: false,
      emptyTop: false,
      body: Center(
        child: BlocBuilder<BookDetailBloc, BookDetailState>(
          buildWhen: (prev, curr) =>
              curr is BookDetailInitState || curr is BookDetailFetchState,
          builder: (context, state) {
            return state.maybeWhen(
              fetch: (BookUiModel book) => _Body(book: book),
              init: () => BaseLoader(),
              orElse: () => BaseLoader(),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final BookUiModel book;

  const _Body({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight,
            ),
            child: Stack(
              children: [
                if (book.volumeInfo.imageLinks?.smallThumbnail != null)
                  Image.network(
                    book.volumeInfo.imageLinks!.smallThumbnail!,
                    fit: BoxFit.fill,
                    width: context.screenSize.width,
                  ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.transparent),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BookDetailAppBar(
                      url: book.volumeInfo.imageLinks?.image,
                      onBackTap: () => context.router.pop(book),
                    ),
                    BookDetailBodyContainer(
                      author: book.authors.isNotEmpty ? book.authors.first : '',
                      title: book.title,
                      bookWebViewUrl: book.accessInfo.webReaderLink,
                      isFavorite: book.isFavorite ?? false,
                      bookId: book.id,
                      pageCount: book.pageCount,
                      averageRating: book.volumeInfo.averageRating,
                      commentsCount: book.comments.length,
                      likesCount: book.likesCount,
                      onFavoriteTap: () {
                        context.read<BookDetailBloc>().add(
                              BookChangeFavoriteEvent(
                                id: book.id,
                                book: book,
                              ),
                            );
                      },
                      onRateTap: (int rate) =>
                          context.read<BookDetailBloc>().add(
                                BookDetailEvent.changeBookRate(
                                  rate: rate,
                                  book: book,
                                ),
                              ),
                      rate: book.rate,
                    ),
                    const SizedBox(height: 8),
                    BookDetailFooterContainer(
                      description: book.description,
                      onCommentLikeTap: ({required int commentId}) =>
                          context.read<BookDetailBloc>().add(
                                BookDetailEvent.changeCommentLikeStatus(
                                  commentId: commentId,
                                  bookId: book.id,
                                ),
                              ),
                      onAddCommentTap: () => showBottomSheet(
                        context: context,
                        builder: (context) => CommentModal(
                          bookId: book.id,
                          onSubmit: ({
                            required String bookId,
                            required String text,
                          }) {
                            context.router.pop();
                            context.read<BookDetailBloc>().add(
                                  BookDetailEvent.addComment(
                                    comment: text,
                                    bookId: bookId,
                                  ),
                                );
                          },
                        ),
                      ),
                      categories: book.categories,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
