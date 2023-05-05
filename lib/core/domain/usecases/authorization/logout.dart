part of domain;

@Injectable()
class LogoutUseCase implements UseCase<LogoutUiModel?, NoParams> {
  final AuthRepository _authRepository;
  final AppDatabase _appDatabase;

  LogoutUseCase(this._authRepository, this._appDatabase);

  @override
  Future<LogoutUiModel?> call(NoParams params) async {
    final result = await _authRepository.logout();
    await _appDatabase.deleteUser();
    return result?.toUiModel();
  }
}
