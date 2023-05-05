part of domain;

@Injectable()
class GetCurrentUserUseCase implements UseCase<UserUiModel?, NoParams> {
  final AppDatabase _appDatabase;

  GetCurrentUserUseCase(this._appDatabase);

  @override
  Future<UserUiModel?> call(NoParams params) async {
    final user = await _appDatabase.getUser();
    return user?.toUserUiModel();
  }
}
