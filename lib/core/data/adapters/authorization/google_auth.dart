part of data;

extension GoogleAuthExtension on GoogleAuthResultDto {
  GoogleAuthModel toModel() {
    return GoogleAuthModel(url: url);
  }
}