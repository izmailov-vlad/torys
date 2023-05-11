part of domain;

extension ImageLinksModelExtension on ImageLinksModel {
  ImageLinksUiModel toUiModel() {
    String? image =
        extraLarge ?? large ?? medium ?? small ?? thumbnail ?? smallThumbnail;

    return ImageLinksUiModel(
      smallThumbnail: smallThumbnail ?? AppImages.bookPlaceholder,
      thumbnail: thumbnail ?? AppImages.bookPlaceholder,
      small: small ?? AppImages.bookPlaceholder,
      medium: medium ?? AppImages.bookPlaceholder,
      large: large ?? AppImages.bookPlaceholder,
      extraLarge: extraLarge ?? AppImages.bookPlaceholder,
      image: image,
    );
  }
}
