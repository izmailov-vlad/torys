part of domain;

abstract class RegisterUseCase {
  Future<Result<void>> call(UserModel user);
}

@Injectable(as: RegisterUseCase)
class RegisterUseCaseImpl extends RegisterUseCase {
  final UserRepository userRepository;
  final DatabaseStorage databaseStorage;

  RegisterUseCaseImpl(
    this.userRepository,
    this.databaseStorage,
  );

  @override
  Future<Result<void>> call(UserModel user) async {
    final result = await userRepository.register(user.toUserData());
    return result;
  }
}
