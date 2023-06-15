part of domain;

@Injectable()
class GetChatGptQuestionsUseCase
    implements UseCase<ChatGptQuestionsUiModel?, NoParams> {
  final ChatGPTRepository _chatGPTRepository;

  GetChatGptQuestionsUseCase(this._chatGPTRepository);

  @override
  Future<ChatGptQuestionsUiModel?> call(params) async {
    final questions = await _chatGPTRepository.getQuestions();
    return questions?.toUiModel();
  }
}
