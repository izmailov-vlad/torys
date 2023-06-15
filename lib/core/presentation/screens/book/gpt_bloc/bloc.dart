library gpt_bloc;

import '../../../../../utils/app_logger.dart';
import '../../../presentation.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

typedef _Emit = Emitter<ChatGptState>;

@Injectable()
class ChatGptBloc extends Bloc<ChatGptEvent, ChatGptState> {
  final AskChatGptUseCase _askChatGptUseCase;
  final GetChatGptQuestionsUseCase _getChatGptQuestionsUseCase;

  ChatGptBloc(
    this._askChatGptUseCase,
    this._getChatGptQuestionsUseCase,
  ) : super(const ChatGptState.init()) {
    on<ChatGptInitEvent>(_init);
    on<ChatGptSendQuestionEvent>(_sendQuestion);
    on<ChatGptChangeQuestionsListEvent>(_changeQuesionsListState);
  }

  Future<void> _sendQuestion(ChatGptSendQuestionEvent event, _Emit emit) async {
    final response = await _askChatGptUseCase(AskChatGptParams(
      questionId: event.questionId,
    ));
    if (response?.text != null) return;
    emit(ChatGptState.showAnswer(answer: response!.text));
  }

  Future<void> _changeQuesionsListState(
    ChatGptChangeQuestionsListEvent event,
    _Emit emit,
  ) async {
    emit(ChatGptState.questionsState(
      isQuestionsExpand: event.isExpand,
    ));
  }

  Future<void> _init(ChatGptInitEvent event, _Emit emit) async {
    try {
      final questions = await _getChatGptQuestionsUseCase(const NoParams());
      if (questions == null) return;
      emit(ChatGptState.fetch(questions: questions));
    } catch (error, stackTrace) {
      ErrorHandler.catchError(
        error,
        stackTrace,
        (error) {},
      );
    }
  }
}
