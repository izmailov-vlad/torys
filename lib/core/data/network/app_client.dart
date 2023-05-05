part of data;

typedef JsonValue = Map<String, dynamic>;

abstract class ApiClient {
  Future<Response> googleAuth();

  Future<Response> auth(AuthRequestDto authRequestDto);

  Future<Response> register(RegisterRequestDto registerRequestDto);

  Future<Response> refreshToken(int userId);

  Future<Response> getCategories();

  Future<Response> getBooksByCategories();

  Future<Response> getBookById(String id);

  Future<Response> getMainBooksContent({required int userId});

  Future<Response> getBooksByCategoryId({required int id});

  Future<Response> logout();

  Future<Response> getBooksByQuery({required SearchRequestDto request});

  Future<Response> getNewBooks();
}

@Injectable(as: ApiClient)
class AppClientImpl implements ApiClient {
  final Dio _dio;

  AppClientImpl(this._dio);

  @override
  Future<Response> auth(authRequestDto) async {
    final json = await _dio.post(
      ApiKeys.auth,
      data: authRequestDto.toJson(),
    );

    return json;
  }

  @override
  Future<Response> register(registerRequestDto) async {
    final json = await _dio.post(
      ApiKeys.register,
      data: registerRequestDto.toJson(),
    );

    return json;
  }

  @override
  Future<Response> getCategories() async {
    final json = await _dio.get(
      ApiKeys.categories,
    );

    return json;
  }

  @override
  Future<Response> getMainBooksContent({required int userId}) async {
    final json = await _dio.get(
      ApiKeys.booksByQuery,
    );

    return json;
  }

  @override
  Future<Response> refreshToken(int userId) async {
    final json = await _dio.get(
      '${ApiKeys.refreshToken}?user_id=$userId',
    );

    return json;
  }

  @override
  Future<Response> getBooksByCategories() async {
    final json = await _dio.get(ApiKeys.booksByCategories);
    return json;
  }

  @override
  Future<Response> getBookById(String id) async {
    final json = await _dio.get('${ApiKeys.bookById}?book_id=$id');
    return json;
  }

  @override
  Future<Response> getBooksByCategoryId({required int id}) async {
    final json = await _dio.get('${ApiKeys.booksByCategoryId}?category_id=$id');
    return json;
  }

  @override
  Future<Response> logout() async {
    final json = await _dio.post(ApiKeys.logout);
    return json;
  }

  @override
  Future<Response> getBooksByQuery({required SearchRequestDto request}) async {
    final json = await _dio.get(
      '${ApiKeys.booksByQuery}?query=${request.query}',
    );
    return json;
  }

  @override
  Future<Response> googleAuth() async {
    final json = await _dio.get(ApiKeys.googleAuth);
    return json;
  }

  @override
  Future<Response> getNewBooks() async {
    final json = await _dio.get(ApiKeys.newBooks);
    return json;
  }
}
