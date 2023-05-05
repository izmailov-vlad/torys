part of data;

@JsonSerializable()
class PaginationDto {
  final int startIndex;
  final int endIndex;

  PaginationDto({required this.startIndex, required this.endIndex});

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);
}
