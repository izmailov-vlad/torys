import 'package:hive/hive.dart';

import 'package:injectable/injectable.dart';

part 'database.g.dart';

abstract class DatabaseStorage {
  Favourites? favourites;
  String? token;
  Future<int> clear();
}

@Injectable(as: DatabaseStorage)
class DatabaseStorageHive implements DatabaseStorage {
  static const _hiveBoxName = 'user';
  static const _favourites = 'favourites';
  static const _token = 'token';
  static Future init() async {
    await Hive.openBox(_hiveBoxName);
  }

  @override
  Future<int> clear() async {
    var result = await _hiveBox.clear();
    return result;
  }

  Box get _hiveBox => Hive.box(_hiveBoxName);

  @override
  Favourites? get favourites {
    return _hiveBox.get(_favourites);
  }

  @override
  set favourites(Favourites? favourites) {
    _hiveBox.put(_favourites, favourites);
  }

  @override
  String? get token {
    var token = _hiveBox.get(_token);
    return token;
  }

  @override
  set token(String? token) {
    _hiveBox.put(_token, token);
  }
}

@HiveType(typeId: 0)
class Favourites extends HiveObject {
  @HiveField(0)
  List<String> favouriteIds;

  Favourites(this.favouriteIds);
}
