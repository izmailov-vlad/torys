part of domain;

@Injectable()
class UserUpdatePhotoUseCase implements UseCase<UserUiModel?, UserPhotoModel> {
  final AuthRepository _authRepository;
  final AppDatabase _appDatabase;

  const UserUpdatePhotoUseCase(
    this._authRepository,
    this._appDatabase,
  );

  @override
  Future<UserUiModel?> call(UserPhotoModel params) async {
    final file = await MultipartFile.fromFile(
      params.userPhotoPath,
      filename: params.userPhotoName,
    );
    final userModel = await _authRepository.updatePhoto(file);
    if (userModel == null) return null;
    await _appDatabase.insertUser(userModel.toCompanion());
    return userModel.toUserUiModel();
  }
}
