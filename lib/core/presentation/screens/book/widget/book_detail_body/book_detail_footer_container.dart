import '../../../../presentation.dart';
import '../../../../widgets/book/book_detail_category.dart';
import '../../bloc/bloc.dart';
import 'book_detail_comments.dart';

class BookDetailFooterContainer extends StatefulWidget {
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
  State<BookDetailFooterContainer> createState() =>
      _BookDetailFooterContainerState();
}

class _BookDetailFooterContainerState extends State<BookDetailFooterContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.categories.isNotEmpty || widget.description.isNotEmpty)
          AppContainer(
            padding: EdgeInsets.symmetric(
              horizontal: AppMargin.largeMargin.w,
              vertical: AppMargin.mediumMargin.h,
            ),
            child: Column(
              children: [
                if (widget.categories.isNotEmpty)
                  Wrap(
                    children: widget.categories
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(
                              bottom: AppPadding.normalPadding.h,
                            ),
                            child: BookDetailCategory(name: e),
                          ),
                        )
                        .toList(),
                  ),
                if (widget.description.isNotEmpty)
                  _Description(description: widget.description),
              ],
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
                        widget.onCommentLikeTap(commentId: commentId),
                  )
                : const SizedBox.shrink(),
            changeComments: (comments) => comments.isNotEmpty
                ? BookDetailComments(
                    comments: comments,
                    onCommentLikeTap: ({required int commentId}) =>
                        widget.onCommentLikeTap(commentId: commentId),
                  )
                : const SizedBox.shrink(),
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
              onPressed: widget.onAddCommentTap,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: BaseText(
                  title: 'Оставить отзыв',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: AppMargin.mediumMargin.h),
      ],
    );
  }
}

class _Description extends StatefulWidget {
  final String description;

  const _Description({Key? key, required this.description}) : super(key: key);

  @override
  State<_Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<_Description> {
  final ValueNotifier<bool> _isDescriptionExpand = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: _isDescriptionExpand,
          builder: (context, isExpand, child) {
            return isExpand
                ? Text(
                    widget.description,
                    style: Theme.of(context).textTheme.headlineLarge?.withColor(
                          AppColorsScheme.black,
                        ),
                  )
                : Text(
                    widget.description.substring(
                      0,
                      widget.description.length ~/ 2,
                    ),
                    style: Theme.of(context).textTheme.headlineLarge?.withColor(
                          AppColorsScheme.black,
                        ),
                  );
          },
        ),
        SizedBox(height: AppMargin.smallMargin.h),
        ValueListenableBuilder(
          valueListenable: _isDescriptionExpand,
          builder: (context, isExpand, child) {
            return BaseText(
              title: isExpand ? 'Свернуть' : 'Развернуть',
              onTap: () =>
                  _isDescriptionExpand.value = !_isDescriptionExpand.value,
              style: Theme.of(context).textTheme.headlineLarge?.withColor(
                    AppColorsScheme.mainColor,
                  ),
            );
          },
        ),
      ],
    );
  }
}
