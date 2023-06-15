part of domain;

abstract class ChatGPTRepository {
  Future<ChatGPTModel?> askQuestion({required ChatGPTRequestDto request});

  Future<ChatGptQuestionsModel?> getQuestions();
}
