part of data;

extension ChatGPTExtension on ChatGPTResultDto {
  ChatGPTModel toModel() {
    return ChatGPTModel(
      response: content,
    );
  }
}

extension ChatGPTQuestionsExtension on ChatGptQuestionsResponseDto {
  ChatGptQuestionsModel toModel() {
    return ChatGptQuestionsModel(
      questions: questions.map((e) => e.toModel()).toList(),
    );
  }
}

extension ChatGPTQuestionExtension on ChatGptQuestionDto {
  ChatGptQuestionModel toModel() {
    return ChatGptQuestionModel(
      id: id,
      text: question ?? '',
    );
  }
}
