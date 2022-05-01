import 'package:torys/core/data/network/model/user.dart';
import 'package:torys/core/domain/entities/user.dart';

extension UserExtension on UserDto {
  User toUserData() {
    return User(name: name, password: password, email: email);
  }
}
