import 'package:hive/hive.dart';

import 'package:injectable/injectable.dart';

part 'database.g.dart';

abstract class DatabaseStorage {
  Favourites? favourites;
  Future<int> clear();
}

@Injectable(as: DatabaseStorage)
class DatabaseStorageHive implements DatabaseStorage {
  static const _hiveBoxName = 'user';
  static const _favourites = 'favourites';

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
}

@HiveType(typeId: 0)
class Favourites extends HiveObject {
  @HiveField(0) 
  List<String> favouriteIds;

  Favourites(this.favouriteIds);
}
