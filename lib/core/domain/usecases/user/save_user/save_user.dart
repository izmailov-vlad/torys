part of domain;

@Injectable()
class SaveUserUseCase implements UseCase<void, SaveUserParams> {
  final AppDatabase _appDatabase;

  SaveUserUseCase(this._appDatabase);

  @override
  Future<void> call(SaveUserParams params) async {
    final user = await _appDatabase.getUser();
    if (user == null) return;
    final editUser = user.copyWith(
      email: params.email,
      name: '${params.name} ${params.surname}',
    );
    await _appDatabase.insertUser(editUser.toCompanion(false));
  }
}