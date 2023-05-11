part of database;

// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/
// A full cross-platform example is available here: https://github.com/simolus3/drift/tree/develop/examples/app

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text()();

  TextColumn get name => text()();
}

class CategoryBooks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

@DriftDatabase(tables: [Users, CategoryBooks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (m) async {
      await m.createAll();
    }, onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        await migrator.createTable(categoryBooks);
      }
    });
  }

  Future<void> deleteUser() async {
    await delete(users).go();
  }

  Future<User?> getUser() => select(users).getSingleOrNull();

  Future<List<CategoryBook>?> getCategories() => select(categoryBooks).get();

  Future<void> insertCategories(
    List<CategoryBooksCompanion> categoriesCompanion,
  ) async =>
      await batch(
        (batch) => batch.insertAll(
          categoryBooks,
          categoriesCompanion,
        ),
      );

  Future<void> insertUser(
    UsersCompanion usersCompanion,
  ) async =>
      batch((batch) => batch
        ..deleteAll(users)
        ..insert(users, usersCompanion));
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
