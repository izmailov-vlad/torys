part of data;

extension AccessInfoExtension on AccessInfoDto {
  AccessInfoModel toModel() {
    return AccessInfoModel(
      webReaderLink: webReaderLink,
    );
  }
}
