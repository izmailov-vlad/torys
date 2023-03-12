part of data;

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {


  UserRepositoryImpl();

  @override
  Future<Result<void>> login(String email, String password) async {
    return Result.success(null);
  }

  @override
  void logout() {}

  @override
  Future<Result<void>> register(User user) async {
    return Result.success(null);
  }
}
