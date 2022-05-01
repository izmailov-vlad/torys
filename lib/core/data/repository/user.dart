import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:torys/core/data/network/model/network_result.dart';
import 'package:torys/core/data/network/model/user.dart';
import 'package:torys/core/data/network/torys_client.dart';
import 'package:torys/utils/result.dart';

abstract class UserRepository {
  Future<Result<String>> login(String email, String password);
  void logout();
  Future<Result<String>> register(User user);
}

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final TorysClient _torysClient;

  UserRepositoryImpl(this._torysClient);
  @override
  Future<Result<String>> login(String email, String password) async {
    try {
      final token = await _torysClient.login({
        "email": email,
        "password": password,
      });
      return Result.success(token);
    } catch (ex) {
      return Result.failure(null);
    }
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  Future<Result<String>> register(User user) async {
    try {
      final token = await _torysClient.register({
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "password_confirmation": user.password,
      });

      return Result.success(token);
    } catch (ex) {
      return Result.failure(null);
    }
  }
}
