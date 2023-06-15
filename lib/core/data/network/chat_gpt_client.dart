part of data;

abstract class ChatGPTClient {
  Future<Response> askQuestion({required ChatGPTRequestDto request});

  Future<Response> getQuestions();
}

@Injectable(as: ChatGPTClient)
class ChatGPTClientImpl implements ChatGPTClient {
  final Dio _dio;

  ChatGPTClientImpl(
    @Named('withTokenDio') this._dio,
  );

  @override
  Future<Response> askQuestion({required ChatGPTRequestDto request}) async {
    final json = await _dio.get(
      ApiKeys.chatGPT,
      data: request.toJson(),
    );

    return json;
  }

  @override
  Future<Response> getQuestions() async {
    final json = await _dio.get(
      ApiKeys.chatGptQuestions,
    );

    return json;
  }
}
