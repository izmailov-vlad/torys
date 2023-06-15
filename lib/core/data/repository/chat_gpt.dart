part of data;

@Injectable(as: ChatGPTRepository)
class ChatGPTRepositoryImpl implements ChatGPTRepository {
  final ChatGPTService _chatGPTService;

  ChatGPTRepositoryImpl(this._chatGPTService);

  @override
  Future<ChatGPTModel?> askQuestion({
    required ChatGPTRequestDto request,
  }) async {
    final result = await _chatGPTService.askQuestion(request: request);
    return result?.toModel();
  }

  @override
  Future<ChatGptQuestionsModel?> getQuestions() async {
    final question = await _chatGPTService.getQuestions();
    return question?.toModel();
  }
}
