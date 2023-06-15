part of data;

@JsonSerializable()
class ChatGPTRequestDto {
  final int questionId;

  ChatGPTRequestDto({
    required this.questionId,
  });

  factory ChatGPTRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTRequestDtoToJson(this);
}