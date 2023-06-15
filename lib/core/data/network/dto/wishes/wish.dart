part of data;

@JsonSerializable()
class WishRequestDto {
  final int categoryId;

  WishRequestDto({
    required this.categoryId,

  });

  factory WishRequestDto.fromJson(Map<String, dynamic> json) =>
      _$WishRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WishRequestDtoToJson(this);
}