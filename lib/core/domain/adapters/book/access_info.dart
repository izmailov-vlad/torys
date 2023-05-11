part of domain;

extension AccessInfoExtension on AccessInfoModel {
  AccessInfoUiModel toUiModel() {
    return AccessInfoUiModel(webReaderLink: webReaderLink);
  }
}
