part of domain;
extension VolumeInfoExtension on VolumeInfoModel {
  VolumeInfo toVolumeInfo() {
    return VolumeInfo(
      title: title,
      subtitle: subtitle,
      authors: authors,
    );
  }
}
