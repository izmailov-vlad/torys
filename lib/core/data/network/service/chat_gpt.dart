part of data;

abstract class ChatGPTService {
  Future<ChatGPTResultDto?> askQuestion({required ChatGPTRequestDto request});

  Future<ChatGptQuestionsResponseDto?> getQuestions();
}

@Injectable(as: ChatGPTService)
class ChatGPTServiceImpl implements ChatGPTService {
  final ChatGPTClient _gptClient;

  ChatGPTServiceImpl(this._gptClient);

  @override
  Future<ChatGPTResultDto?> askQuestion({
    required ChatGPTRequestDto request,
  }) async {
    final responseJson = await _gptClient.askQuestion(request: request);
    final ChatGPTResultDto responseDto = ChatGPTResultDto.fromJson(
      responseJson.data,
    );
    return responseDto;
  }

  @override
  Future<ChatGptQuestionsResponseDto?> getQuestions() async {
    final responseJson = await _gptClient.getQuestions();
    final ChatGptQuestionsResponseDto responseDto =
        ChatGptQuestionsResponseDto.fromJson(
      responseJson.data,
    );
    return responseDto;
  }
}
