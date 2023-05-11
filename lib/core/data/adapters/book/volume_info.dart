part of data;

extension VolumeInfoExtension on VolumeInfoDto {
  VolumeInfoModel toModel() {
    return VolumeInfoModel(
      subtitle: subtitle ?? '',
      authors: authors ?? [],
      title: title,
      averageRating: averageRating ?? 0,
      imageLinks: imageLinks?.toModel(),
    );
  }
}
