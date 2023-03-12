part of domain;

abstract class LogInUseCase {
  Future<Result<void>> call(String email, String password);
}

@Injectable(as: LogInUseCase)
class LogInUseCaseImpl extends LogInUseCase {
  final UserRepository userRepository;
  final DatabaseStorage databaseStorage;

  LogInUseCaseImpl(this.userRepository, this.databaseStorage);

  @override
  Future<Result<void>> call(String email, String password) async {
    var result = await userRepository.login(email, password);
    return result;
  }
}
