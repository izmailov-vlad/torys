import '../../../presentation.dart';
import '../../../widgets/base/base_image.dart';
import '../../../widgets/base/base_title.dart';

class BookListItem extends StatelessWidget {
  final String title;
  final String author;
  final int publishYear;
  final String description;
  final String? imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const BookListItem({
    Key? key,
    required this.title,
    required this.author,
    required this.publishYear,
    required this.description,
    this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      padding: EdgeInsets.only(
        left: AppPadding.normalPadding.w,
        right: AppPadding.normalPadding.w,
        top: AppPadding.bigPadding.w,
        bottom: AppPadding.bigPadding.w,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseImage(
                imageType:
                    imageUrl != null ? ImageType.network : ImageType.asset,
                imagePath:
                    imageUrl != null ? imageUrl! : AppImages.bookPlaceholder,
                height: 150,
              ),
              SizedBox(width: AppMargin.mediumMargin.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      title: title,
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: AppMargin.superSmallMargin.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BaseText(
                            title: '$author $publishYear',
                            style: context.theme.textTheme.bodyLarge,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppMargin.smallMargin.h),
                    BaseText(
                      title: description,
                      maxLines: 4,
                      style: context.theme.textTheme.bodyLarge
                          ?.withColor(AppColorsScheme.grey2)
                          .copyWith(height: 1.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
