import 'package:injectable/injectable.dart';
import 'package:torys/core/data/repository/books.dart';
import 'package:torys/core/data/repository/user.dart';
import 'package:torys/core/data/storage/database.dart';
import 'package:torys/core/domain/entities/user.dart';
import 'package:torys/core/domain/adapters/user.dart';
import 'package:torys/utils/result.dart';

abstract class RegisterUseCase {
  Future<Result<void>> call(String email, String name, String password);
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
  Future<Result<void>> call(String email, String name, String password) async {
    final user = UserDto(email: email, password: password, name: name);
    final result = await userRepository.register(user.toUserData());
    databaseStorage.token = result.value;
    return result;
  }
}
