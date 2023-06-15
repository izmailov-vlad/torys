part of data;

@JsonSerializable()
class PaginationDto {
  final int startIndex;
  final int maxResult;

  PaginationDto({required this.startIndex, required this.maxResult});

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);
}
