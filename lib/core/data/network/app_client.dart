part of data;

abstract class AppClient {
  Future<Map<String, dynamic>> auth();

  Future<Map<String, dynamic>> getGenres();
}

@Injectable(as: AppClient)
class AppClientImpl implements AppClient {
  final Dio dio;

  AppClientImpl(this.dio);

  @override
  Future<Map<String, dynamic>> auth() async {
    final json = {
      'success' : true,
    };
    return json;
  }

  @override
  Future<Map<String, dynamic>> getGenres() async {
    final genresJson = {
      'genres': [
        {
          'id': 1,
          'name': 'Ужасы',
        },
        {
          'id': 2,
          'name': 'Фэнтези',
        },
        {
          'id': 3,
          'name': 'Детективы',
        },
        {
          'id': 4,
          'name': 'Биография',
        }
      ]
    };

    return genresJson;
  }
}
