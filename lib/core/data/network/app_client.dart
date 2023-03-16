part of data;

abstract class AppClient {
  Future<Map<String, dynamic>> auth();

  Future<Map<String, dynamic>> getGenres();

  Future<Map<String, dynamic>> getPopularBooks({required int userId});
}

@Injectable(as: AppClient)
class AppClientImpl implements AppClient {
  final Dio dio;

  AppClientImpl(this.dio);

  @override
  Future<Map<String, dynamic>> auth() async {
    final json = {
      'success': true,
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
        },
        {
          'id': 5,
          'name': 'Фантастика',
        },
      ]
    };

    return genresJson;
  }

  @override
  Future<Map<String, dynamic>> getPopularBooks({required int userId}) async {
    final popularBooksJson = {
      'books': [
        {
          'id': 1,
          'title': 'Лето Волонтера',
          'image': AppImages.book,
          'author': 'Сергей Лукьяненко',
          'rate': 4.6,
        },
        {
          'id': 2,
          'title': 'Лето Волонтера',
          'image': AppImages.book,
          'author': 'Сергей Лукьяненко',
          'rate': 4.6,
        },
        {
          'id': 3,
          'title': 'Лето Волонтера',
          'image': AppImages.book,
          'author': 'Сергей Лукьяненко',
          'rate': 4.6,
        },
        {
          'id': 4,
          'title': 'Лето Волонтера',
          'image': AppImages.book,
          'author': 'Сергей Лукьяненко',
          'rate': 4.6,
        }
      ]
    };

    return popularBooksJson;
  }
}
