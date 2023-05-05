part of data;

extension LogoutExtension on LogoutResponseDto {
  LogoutModel toModel() {
    return LogoutModel(success: success);
  }
}
