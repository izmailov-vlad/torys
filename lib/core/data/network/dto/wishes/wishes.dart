part of data;

@JsonSerializable()
class WishesRequestDto {
  final List<WishRequestDto> wishes;

  WishesRequestDto({
    required this.wishes,
  });

  factory WishesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$WishesRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WishesRequestDtoToJson(this);
}
