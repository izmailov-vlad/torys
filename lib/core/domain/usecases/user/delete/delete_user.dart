part of domain;

@Injectable()
class DeleteUserUseCase implements UseCase<bool?, NoParams> {
  final AuthRepository _authRepository;

  DeleteUserUseCase(this._authRepository);

  @override
  Future<bool?> call(NoParams params) async {
    final isDeleted = await _authRepository.delete();
    return isDeleted;
  }

}