part of data;

@JsonSerializable()
class DefaultResultDto {
  @Named('success')
  final bool success;

  DefaultResultDto(this.success);

  factory DefaultResultDto.fromJson(Map<String, dynamic> json) =>
      _$DefaultResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResultDtoToJson(this);
}

@JsonSerializable()
class DefaultStringValueResultDto {
  @Named('success')
  final bool success;
  final String value;

  DefaultStringValueResultDto(this.success, this.value);

  factory DefaultStringValueResultDto.fromJson(Map<String, dynamic> json) =>
      _$DefaultStringValueResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultStringValueResultDtoToJson(this);
}

@JsonSerializable()
class DefaultIntValueResultDto {
  @Named('success')
  final bool success;
  final int value;

  DefaultIntValueResultDto(this.success, this.value);

  factory DefaultIntValueResultDto.fromJson(Map<String, dynamic> json) =>
      _$DefaultIntValueResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultIntValueResultDtoToJson(this);
}
