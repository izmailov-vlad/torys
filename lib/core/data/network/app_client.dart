part of data;

typedef JsonValue = Map<String, dynamic>;

abstract class ApiClient {
  Future<Response> googleAuth({required GoogleAuthRequestDto request});

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

  Future<Response> changeFavorite({required String id});

  Future<Response> addComment({
    required AddCommentRequestDto request,
    required String bookId,
  });

  Future<Response> getBookComments({
    required GetBookCommentsRequestDto request,
  });

  Future<Response> bookChangeLikeStatus({
    required ChangeLikeStatusRequestDto request,
  });

  Future<Response> bookRate({
    required ChangeBookRateRequestDto request,
  });

  Future<Response> getUserFavorite();
}

@Injectable(as: ApiClient)
class AppClientImpl implements ApiClient {
  final Dio _dio;
  final Dio _withoutTokenDio;

  AppClientImpl(
    @Named('withTokenDio') this._dio,
    @Named('withoutTokenDio') this._withoutTokenDio,
  );

  @override
  Future<Response> auth(authRequestDto) async {
    final json = await _withoutTokenDio.post(
      ApiKeys.auth,
      data: authRequestDto.toJson(),
    );

    return json;
  }

  @override
  Future<Response> register(registerRequestDto) async {
    final json = await _withoutTokenDio.post(
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
    final json = await _withoutTokenDio.get(
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
  Future<Response> googleAuth({required GoogleAuthRequestDto request}) async {
    final json = await _dio.post(
      ApiKeys.googleAuth,
      data: request.toJson(),
    );
    return json;
  }

  @override
  Future<Response> getNewBooks() async {
    final json = await _dio.get(ApiKeys.newBooks);
    return json;
  }

  @override
  Future<Response> changeFavorite({required String id}) async {
    final json = await _dio.post('${ApiKeys.changeFavorite}?book_id=$id');
    return json;
  }

  @override
  Future<Response> addComment({
    required AddCommentRequestDto request,
    required String bookId,
  }) async {
    final json = await _dio.post(
      '${ApiKeys.storeComment}?book_id=$bookId',
      data: request.toJson(),
    );
    return json;
  }

  @override
  Future<Response> getBookComments({
    required GetBookCommentsRequestDto request,
  }) async {
    final json = await _dio.get(
      '${ApiKeys.bookComments}?book_id=${request.bookId}',
    );
    return json;
  }

  @override
  Future<Response> bookChangeLikeStatus(
      {required ChangeLikeStatusRequestDto request}) async {
    final json = await _dio.post(
      '${ApiKeys.changeCommentLikeStatus}?comment_id=${request.commentId}',
    );
    return json;
  }

  @override
  Future<Response> bookRate({required ChangeBookRateRequestDto request}) async {
    final json = await _dio.post(
      '${ApiKeys.rateBook}?book_id=${request.bookId}&rate=${request.rate}',
    );
    return json;
  }

  @override
  Future<Response> getUserFavorite() async {
    final json = await _dio.get(ApiKeys.userFavorite);
    return json;
  }
}
