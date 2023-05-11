import '../../../../presentation.dart';
import '../../../../widgets/base/base_container.dart';
import '../../../../widgets/book/book_detail_category.dart';
import '../../bloc/bloc.dart';
import 'book_detail_comments.dart';

class BookDetailFooterContainer extends StatelessWidget {
  final String description;
  final VoidCallback onAddCommentTap;
  final List<String> categories;
  final Function({required int commentId}) onCommentLikeTap;

  const BookDetailFooterContainer({
    Key? key,
    required this.description,
    required this.onAddCommentTap,
    required this.onCommentLikeTap,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.symmetric(
        horizontal: AppMargin.largeMargin.w,
        vertical: AppMargin.mediumMargin.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: categories
                .map((e) => Padding(
                      padding: EdgeInsets.only(
                        bottom: AppPadding.normalPadding.h,
                      ),
                      child: BookDetailCategory(name: e),
                    ))
                .toList(),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.headlineLarge?.withColor(
                  AppColorsScheme.black,
                ),
          ),
          SizedBox(height: AppMargin.smallMargin.h),
          BlocBuilder<BookDetailBloc, BookDetailState>(
            buildWhen: (prev, curr) =>
                curr is BookDetailFetchState || curr is BookDetailCommentsState,
            builder: (context, state) => state.maybeWhen(
              init: () => const BaseLoader(),
              fetch: (book) => book.comments.isNotEmpty
                  ? BookDetailComments(
                      comments: book.comments,
                      onCommentLikeTap: ({required int commentId}) =>
                          onCommentLikeTap(commentId: commentId),
                    )
                  : const SizedBox.shrink(),
              changeComments: (comments) {
                return BookDetailComments(
                  comments: comments,
                  onCommentLikeTap: ({required int commentId}) =>
                      onCommentLikeTap(commentId: commentId),
                );
              },
              orElse: () => const BaseLoader(),
            ),
          ),
          SizedBox(height: AppMargin.mediumMargin.h),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppPadding.largePadding.w),
              child: BaseButton(
                onPressed: onAddCommentTap,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: BaseText(
                    title: 'Оставить отзыв',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
