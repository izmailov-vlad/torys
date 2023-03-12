part of domain;

abstract class UserRepository {
  Future<Result<void>> login(String email, String password);

  Future<Result<void>> register(User user);

  void logout();
}

