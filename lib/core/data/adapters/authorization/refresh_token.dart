part of data;

extension RereshTokenExtension on RefreshTokenResponseDto {
  RefreshTokenModel toModel() {
    return RefreshTokenModel(token: token);
  }
}
