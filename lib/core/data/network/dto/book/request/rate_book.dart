part of data;

@JsonSerializable()
class ChangeBookRateRequestDto {
  final String bookId;
  final int rate;

  ChangeBookRateRequestDto({
    required this.bookId,
    required this.rate,
  });

  factory ChangeBookRateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangeBookRateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeBookRateRequestDtoToJson(this);
}
