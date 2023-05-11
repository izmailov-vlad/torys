import '../../../../presentation.dart';
import '../../../../widgets/base/base_image.dart';

class BookDetailComments extends StatelessWidget {
  final List<CommentUiModel> comments;
  final Function({required int commentId}) onCommentLikeTap;

  const BookDetailComments({
    Key? key,
    required this.comments,
    required this.onCommentLikeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: comments.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var padding = EdgeInsets.only(right: AppPadding.mediumPadding.w);
          if (index == 0) {
            padding = padding.copyWith(left: AppPadding.mediumPadding.w);
          }
          return Padding(
            padding: padding,
            child: _CommentItem(
              userName: comments[index].user.name,
              comment: comments[index].text,
              liked: comments[index].liked,
              onLikeTap: () => onCommentLikeTap(commentId: comments[index].id),
            ),
          );
        },
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final String userName;
  final String comment;
  final bool liked;
  final VoidCallback onLikeTap;

  const _CommentItem({
    Key? key,
    required this.userName,
    required this.comment,
    required this.liked,
    required this.onLikeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.all(16),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BaseImage(
                imageType: ImageType.asset,
                imagePath: AppImages.profilePersonPlaceholderGrey,
                height: 35,
                width: 35,
              ),
              SizedBox(width: AppMargin.mediumMargin.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(title: userName),
                  const BaseText(title: '11 апреля 2022'),
                ],
              ),
            ],
          ),
          SizedBox(height: AppMargin.smallMargin.h),
          Expanded(
            child: BaseText(
              title: comment,
              maxLines: 10,
            ),
          ),
          Row(
            children: [
              _Icon(
                icImage:
                    liked ? AppImages.icInFavorite : AppImages.icOutFavorite,
                value: 32,
                onTap: onLikeTap,
              ),
              SizedBox(width: AppPadding.mediumPadding.w),
              _Icon(
                icImage: AppImages.icComment,
                value: 32,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final String icImage;
  final int value;
  final VoidCallback onTap;

  const _Icon({
    Key? key,
    required this.icImage,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      fillColor: AppColorsScheme.secondary4,
      padding: EdgeInsets.all(AppPadding.normalPadding.h),
      child: Row(
        children: [
          BaseImage(
            imageType: ImageType.asset,
            imagePath: icImage,
            height: 16,
            width: 16,
            onTap: onTap,
          ),
          const SizedBox(width: 4),
          BaseText(
            title: value.toString(),
            style: context.theme.textTheme.bodyLarge?.withColor(
              AppColorsScheme.grey1,
            ),
          ),
        ],
      ),
    );
  }
}
