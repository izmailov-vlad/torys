part of domain;

@Injectable()
class SaveUserUseCase implements UseCase<UserUiModel?, SaveUserParams> {
  final AppDatabase _appDatabase;
  final AuthRepository _authRepository;

  const SaveUserUseCase(
    this._appDatabase,
    this._authRepository,
  );

  @override
  Future<UserUiModel?> call(SaveUserParams params) async {
    final currUser = await _appDatabase.getUser();
    if (currUser == null) return null;
    MultipartFile? userPhoto;
    if (params.userPhoto != null) {
      userPhoto = await MultipartFile.fromFile(
        params.userPhoto!.userPhotoPath,
        filename: params.userPhoto!.userPhotoName,
      );
    }

    final user = await _authRepository.editUser(
      EditUserRequestDto(
        currUser.id,
        params.email ?? currUser.email,
        params.name ?? currUser.name,
        {
          'photo': userPhoto,
        },
      ),
    );
    if (user == null) return null;

    await _appDatabase.insertUser(user.toCompanion());

    return user.toUserUiModel();
  }
}
