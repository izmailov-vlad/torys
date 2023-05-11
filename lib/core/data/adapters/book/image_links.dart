part of data;

extension ImageLinksExtension on ImageLinksDto {
  ImageLinksModel toModel() {
    return ImageLinksModel(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
      small: small,
      medium: medium,
      large: large,
      extraLarge: extraLarge,
    );
  }
}
