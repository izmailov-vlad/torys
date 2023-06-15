part of data;

@JsonSerializable()
class ChatGptQuestionsResponseDto {
  final List<ChatGptQuestionDto> questions;

  const ChatGptQuestionsResponseDto({
    required this.questions,
  });

  factory ChatGptQuestionsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatGptQuestionsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGptQuestionsResponseDtoToJson(this);
}

@JsonSerializable()
class ChatGptQuestionDto {
  final int id;
  final String question;

  const ChatGptQuestionDto({
    required this.id,
    required this.question,
  });

  factory ChatGptQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$ChatGptQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGptQuestionDtoToJson(this);
}
