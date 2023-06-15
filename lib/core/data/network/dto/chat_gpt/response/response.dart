part of data;

@JsonSerializable()
class ChatGPTResultDto {
  final String content;

  ChatGPTResultDto({
    required this.content,
  });

  factory ChatGPTResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTResultDtoToJson(this);
}