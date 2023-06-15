part of domain;

extension ChatGPTModelExtension on ChatGPTModel {
  ChatGptAnswerUiModel toUiModel() {
    return ChatGptAnswerUiModel(
      text: response,
    );
  }
}

extension ChatGPTQuestionsUiModelExtension on ChatGptQuestionsModel {
  ChatGptQuestionsUiModel toUiModel() {
    return ChatGptQuestionsUiModel(
      questions: questions.map((e) => e.toUiModel()).toList(),
    );
  }
}

extension ChatGPTQuestionUiModelExtension on ChatGptQuestionModel {
  ChatGptQuestionUiModel toUiModel() {
    return ChatGptQuestionUiModel(id: id, question: text);
  }
}
