part of gpt_bloc;

@freezed
class ChatGptState with _$ChatGptState {
  const factory ChatGptState.init() = ChatGptInitState;

  const factory ChatGptState.fetch({
    required ChatGptQuestionsUiModel questions,
  }) = ChatGptFetchState;

  const factory ChatGptState.questionsState({
    required bool isQuestionsExpand,
  }) = ChatGptQuestionsState;

  const factory ChatGptState.showAnswer({
    required String answer,
  }) = ChatGptAnswerState;
}
