part of domain;

@Injectable()
class AskChatGptUseCase implements UseCase<ChatGptAnswerUiModel?, AskChatGptParams> {
  final ChatGPTRepository _chatGPTRepository;

  AskChatGptUseCase(this._chatGPTRepository);

  @override
  Future<ChatGptAnswerUiModel?> call(params) async {
    final result = await _chatGPTRepository.askQuestion(
      request: ChatGPTRequestDto(questionId: params.questionId),
    );
    return result?.toUiModel();
  }
}
