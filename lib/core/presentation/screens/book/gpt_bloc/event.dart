part of gpt_bloc;

@freezed
class ChatGptEvent with _$ChatGptEvent {
  const factory ChatGptEvent.init() = ChatGptInitEvent;
  const factory ChatGptEvent.sendQuestion({required int questionId} ) = ChatGptSendQuestionEvent;
  const factory ChatGptEvent.changeQuestionsListState({required bool isExpand}) = ChatGptChangeQuestionsListEvent;
}